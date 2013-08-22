# This handler must be deploy (copy the .rb file) in Rack gem handlers directory (lib\rack\handler).
# For example, with Ruby + gem => Ruby\lib\ruby\gems\1.9.1\gems\rack-1.4.1\lib\rack\handler
module Rack
  module Handler
    class SuburiMongrel < Handler::Mongrel
      def self.run(app, options={})
        server = ::Mongrel::HttpServer.new(
          options[:Host]           || '0.0.0.0',
          options[:Port]           || 8080,
          options[:num_processors] || 950,
          options[:throttle]       || 0,
          options[:timeout]        || 60)
        # Acts like Rack::URLMap, utilizing Mongrel's own path finding methods.
        # Use is similar to #run, replacing the app argument with a hash of
        # { path=>app, ... } or an instance of Rack::URLMap.
        if options[:map]
          if app.is_a? Hash
            app.each do |path, appl|
              path = '/'+path unless path[0] == ?/
              server.register(path, Rack::Handler::Mongrel.new(appl))
            end
          elsif app.is_a? URLMap
            app.instance_variable_get(:@mapping).each do |(host, path, appl)|
             next if !host.nil? && !options[:Host].nil? && options[:Host] != host
             path = '/'+path unless path[0] == ?/
             server.register(path, Rack::Handler::Mongrel.new(appl))
            end
          else
            raise ArgumentError, "first argument should be a Hash or URLMap"
          end
        else
          # TODO: what happens when ENV is not set properly? FAILS
          path = '/'
          path = ENV['RAILS_RELATIVE_URL_ROOT'] if ENV['RAILS_RELATIVE_URL_ROOT']
          server.register(path, Rack::Handler::Mongrel.new(app))
        end
        yield server  if block_given?
        server.run.join
      end
    end
  end
end

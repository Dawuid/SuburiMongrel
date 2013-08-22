Gem::Specification.new do |s|
  s.name        = 'SuburiMongrel'
  s.version     = '0.1.0'
  s.date        = '2013-08-22'
  s.summary     = "Rack Handler to allow suburis in Mongrel"
  s.description = "A simple rack handler to allow to use suburis without using --prefix"
  s.authors     = ["Dawuid"]
  s.files       = ["lib/rack/handler/suburi_mongrel.rb"]
  s.homepage    =
    'http://github.com/Dawuid/SuburiMongrel-rack-handler'
  s.license       = 'MIT'
  s.add_runtime_dependency 'rack', '~> 1.3'
end
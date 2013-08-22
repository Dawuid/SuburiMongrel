SuburiMongrel-rack-handler
==========================

Rack handler to deploy Mongrel server in an suburi.

Use
---

1. Install gem

    `gem install SuburiMongrel-rack-handler`

2. Configure suburi in `ENV['RAILS_RELATIVE_URL_ROOT']` (maybe in your code?)

    `ENV['RAILS_RELATIVE_URL_ROOT'] = '/my/own/url/path'`

3. Start Rails application with Bundle

    `bundle exec rails server SuburiMongrel`

Redmine users
-------------

If you are using this gem to serve your redmine server in an deep uri then you can
put Step 2 in your `<redmine>/config/environments/<your_environment_file>.rb`. Remenber
to add:

```ruby
# Path to deploy redmine of this environment in web server
ENV['RAILS_RELATIVE_URL_ROOT'] = '/my/own/url/path'
config.relative_url_root = ENV['RAILS_RELATIVE_URL_ROOT']
```
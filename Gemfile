source "https://rubygems.org"

ruby '2.2.6'

gem 'addressable'
gem 'fog-radosgw', git: 'https://github.com/orange-cloudfoundry/fog-radosgw', branch: 'master'
gem 'fog'
gem 'sinatra'
gem 'mime-types'
gem 'unf'
gem 'settingslogic'
gem 'cf-registrar', git: 'https://github.com/cloudfoundry/cf-registrar'
gem 'nats'

group :test do
  gem 'rake'
  gem 'rack-test', require: 'rack/test'
  gem 'rspec'
  gem 'json_spec'
  gem 'codeclimate-test-reporter', require: nil
end

group :development, :test do
  gem 'awesome_print'
  gem 'webmock'
end

group :development do
  gem 'roodi'
end

group :production do
  gem 'unicorn'
end


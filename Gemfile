source 'https://rubygems.org'
source 'https://gem.fury.io/joseph-bigbee/' do
end
# Specify your gem's dependencies in bigbee_labs-graph_api_libs.gemspec
gemspec

=begin
gem 'bigbee_labs-associations',             path: '~/rails_projects/gems_and_engines/bigbee_labs-associations'
gem 'app_collaborators',                    path: '~/rails_projects/bigbee/app_collaborators'
=end

group :development do 
  gem 'guard-rspec', require: false
  gem 'figaro'
end

group :development, :test do 
  gem 'webmock'
  gem 'bigbee_labs-remote_models_base',       path: '~/rails_projects/bigbee_labs/gems/bigbee_labs-remote_models_base'
  gem 'bigbee_labs-http_actions',             path: '~/rails_projects/bigbee_labs/gems/http_actions'
end
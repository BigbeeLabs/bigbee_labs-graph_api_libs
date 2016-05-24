# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bigbee_labs/graph_api_libs/version'

Gem::Specification.new do |spec|
  spec.name          = "bigbee_labs-graph_api_libs"
  spec.version       = BigbeeLabs::GraphApiLibs::VERSION
  spec.authors       = ["Joseph"]
  spec.email         = ["villajosephe@gmail.com"]

  spec.summary       = %q{Write a short summary, because Rubygems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "http://www.bigbeelabs.com"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  #spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'bigbee_labs-remote_models_base',   '~> 0.0.7'
=begin
  spec.add_dependency 'bigbee_labs-associations',         '~> 0.0.1'
=end  

  spec.add_development_dependency "bundler",  "~> 1.10"
  spec.add_development_dependency "rake",     "~> 10.0"
  spec.add_development_dependency "rspec",    "~> 3.4"

  spec.add_development_dependency "rails", "~> 4.2"
  spec.add_development_dependency 'pg',                  '~> 0.18'
  spec.add_development_dependency 'rspec-rails',         '~> 3.4'
  spec.add_development_dependency 'capybara',            '~> 2.5'
  spec.add_development_dependency 'factory_girl_rails',  '~> 4.5'
  #spec.add_development_dependency 'cucumber-rails',      '~> 1.4'
  spec.add_development_dependency 'database_cleaner',    '~> 1.5'
  spec.add_development_dependency 'selenium-client',     '~> 1.2'
  spec.add_development_dependency 'selenium-webdriver',  '~> 2.48'
  spec.add_development_dependency 'shoulda-matchers',    '~> 3.0'
  spec.add_development_dependency 'webrat',              '~> 0.7'
  spec.add_development_dependency 'acts-as-taggable-on', '~> 3.5'  
end

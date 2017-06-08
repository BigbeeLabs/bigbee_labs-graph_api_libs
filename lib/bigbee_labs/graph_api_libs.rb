#require "bigbee_labs/graph_api/base"
require "bigbee_labs/graph_api_libs/version"
require 'bigbee_labs/remote_models_base'
require 'active_support/dependencies'

=begin
module BigbeeGraph
  class Base
    APP_PROVIDER_NAME = 'bigbee_graph'
    include BigbeeLabs::RemoteModels::Base
  end
end
=end
Dir[Gem::Specification.find_by_name("bigbee_labs-graph_api_libs").gem_dir + "/lib/bigbee_labs/graph_api/**/*.rb"].each do |f| 
  require f
end
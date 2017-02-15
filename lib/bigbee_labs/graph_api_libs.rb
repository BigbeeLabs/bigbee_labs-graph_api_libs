#require "bigbee_labs/graph_api/base"
require "bigbee_labs/graph_api_libs/version"
require 'bigbee_labs/remote_models_base'
require 'active_support/dependencies'

#Dir[Gem::Specification.find_by_name("bigbee_labs-graph_api_libs").gem_dir + "/lib/bigbee_labs/graph_api/acts_as/**/*.rb"].each{|f| require f}
Dir[Gem::Specification.find_by_name("bigbee_labs-graph_api_libs").gem_dir + "/lib/bigbee_labs/graph_api/**/*.rb"].each{|f| require f}
Dir[Gem::Specification.find_by_name("bigbee_labs-graph_api_libs").gem_dir + "/lib/bigbee_graph/**/*.rb"].each{|f| require f}

module BigbeeLabs
  module GraphApiLibs
    # Your code goes here...
  end
end


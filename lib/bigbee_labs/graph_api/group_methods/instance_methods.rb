gem_spec = Gem::Specification.find_by_name("bigbee_labs-graph_api_libs")
sub_dir = "/lib/bigbee_labs/graph_api/group_methods/instance_methods"
files_to_require = Dir["#{gem_spec.gem_dir}#{sub_dir}/*.rb"]
files_to_require.each do |f| 
  require_dependency f
  include "BigbeeLabs::GraphApi::GroupMethods::InstanceMethods::#{f.split('/').last.split('.').first.camelize}".constantize
end


module BigbeeLabs
  module GraphApi
    module GroupMethods
      module InstanceMethods

      end
    end
  end
end

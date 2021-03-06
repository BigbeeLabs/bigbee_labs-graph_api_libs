model = "person_module"
gem_spec = Gem::Specification.find_by_name("bigbee_labs-graph_api_libs")
sub_dir = "/lib/bigbee_labs/graph_api/#{model}/instance_methods"
files_to_require = Dir["#{gem_spec.gem_dir}#{sub_dir}/*.rb"]
files_to_require.each do |f| 
  require_dependency f
  include "BigbeeLabs::GraphApi::PersonModule::InstanceMethods::#{f.split('/').last.split('.').first.camelize}".constantize
end

module BigbeeLabs
  module GraphApi
    module PersonModule
      module InstanceMethods
        #include GetPersonalInformation
        #include UpdatePersonalInformation
        #include ConfirmProgramEnrollment
        #include ContactInformation
        #include GroupsForAdministratedOrganization
      end
    end
  end
end
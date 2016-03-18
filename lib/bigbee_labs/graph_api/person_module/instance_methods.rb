require_dependency 'bigbee_labs/graph_api/person_module/instance_methods/get_personal_information'

module BigbeeLabs
  module GraphApi
    module PersonModule
      module InstanceMethods
        include GetPersonalInformation
      end
    end
  end
end
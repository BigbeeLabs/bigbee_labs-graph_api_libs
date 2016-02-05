require 'bigbee_labs/graph_api/acts_as/administrating/class_methods/acts_as_administrating_base'
require 'bigbee_labs/graph_api/acts_as/administrating/class_methods/acts_as_administrating_optioned'
module BigbeeLabs
  module GraphApi
    module ActsAs
      module Administrating
        module ClassMethods
          #include ActsAsAdministrating
          include ActsAsAdministratingBase
          include ActsAsAdministratingOptioned

        end
      end
    end
  end
end
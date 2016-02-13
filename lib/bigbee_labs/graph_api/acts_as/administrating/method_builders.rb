require 'bigbee_labs/graph_api/acts_as/administrating/method_builders/administrated_thing_with'
require 'bigbee_labs/graph_api/acts_as/administrating/method_builders/administrated_things'
require 'bigbee_labs/graph_api/acts_as/administrating/method_builders/create_administrated_thing'

module BigbeeLabs
  module GraphApi
    module ActsAs
      module Administrating
        module MethodBuilders
          include AdministratedThingWith
          include AdministratedThings
          include CreateAdministratedThing
        end
      end
    end
  end
end
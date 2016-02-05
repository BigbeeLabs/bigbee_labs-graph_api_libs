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
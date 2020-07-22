module BigbeeLabs
  module GraphApi
    module Contacts
      module PhoneNumber

        def self.included(base)
          base.class_eval do  
            my_klass.remote_attributes  += [:id, :number, :created_at, :updated_at, :errors, :label]
            my_klass.remote_requires    += [:number]
            my_klass.remote_permits     += [:number, :label]
          end
        end
        
      end
    end
  end
end
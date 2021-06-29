module BigbeeLabs
  module GraphApi
    module PhoneNumberType

      def self.included(base)
        base.class_eval do  
          my_klass.remote_attributes  += [:id, :system_name, :display_name, :errors]
          my_klass.remote_requires    += [:id, :system_name]
          my_klass.remote_permits     += [:display_name]

          api_version 'v1'
          
        end
      end
      
    end
  end
end
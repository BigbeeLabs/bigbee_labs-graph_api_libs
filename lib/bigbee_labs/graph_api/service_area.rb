module BigbeeLabs
  module GraphApi
    module ServiceArea

      def self.included(base)
        base.class_eval do 
          my_klass.remote_attributes  += [:id, :display_name, :description, :system_name, :service_provider_type, :service_provider_id, :errors]
          my_klass.remote_permits     += [:id, :display_name, :description, :system_name]
          my_klass.remote_requires    += [:name, :display_name, :system_name]
        end
      end

    end
  end
end
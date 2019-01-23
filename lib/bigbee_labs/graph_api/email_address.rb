module BigbeeLabs
  module GraphApi
    module EmailAddress

      def self.included(base)
        base.class_eval do  
          my_klass.remote_attributes  += [:id, :address, :created_at, :updated_at, :errors, :is_primary, :label, :credential, :label, :validation_status]
          my_klass.remote_requires    += [:address]
          my_klass.remote_permits     += [:address, :label, :validation_status]
        end
      end

    end
  end
end
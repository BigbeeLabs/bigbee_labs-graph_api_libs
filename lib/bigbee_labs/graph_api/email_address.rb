module BigbeeLabs
  module GraphApi
    module EmailAddress

      def self.included(base)
        base.class_eval do  
          my_klass.remote_attributes  += [:id, :address, :created_at, :updated_at, :errors, :is_primary, :label, :credential, :label]
          my_klass.remote_requires    += [:address]
          my_klass.remote_permits     += [:address, :label]
        end
      end

    end
  end
end
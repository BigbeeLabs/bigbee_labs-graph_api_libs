module BigbeeLabs
  module GraphApi
    module ReferralSourceType

      def self.included(base)
        base.class_eval do  
          my_klass.remote_attributes  += [:id, :system_name, :display_name, :created_at, :updated_at, :errors]
          my_klass.remote_requires    += [:id, :system_name, :display_name]
          my_klass.remote_permits     += [:system_name, :display_name]
        end
      end
      
    end
  end
end
module BigbeeLabs
  module GraphApi
=begin    
    class EmailAddress < Base

      REMOTE_ATTRIBUTES   = [:id, :address, :create_ad, :updated_at]
      REMOTE_REQUIRES     = [:address]
      REMOTE_PERMITS      = [:address]

    end
=end
    module EmailAddress
      def self.included(base)
        base.class_eval do  
          my_klass.remote_attributes  = [:id, :address, :create_ad, :updated_at]
          my_klass.remote_requires    = [:address]
          my_klass.remote_permits     = [:address]
        end
      end
    end

  end
end
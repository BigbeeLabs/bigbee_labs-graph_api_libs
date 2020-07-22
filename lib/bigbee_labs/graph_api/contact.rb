module BigbeeLabs
  module GraphApi
    module Contact

      def self.included(base)
        base.class_eval do 
          my_klass.remote_attributes  += [:id, :first_name, :last_name, :errors]
          my_klass.remote_requires    += [:first_name, :last_name]
          my_klass.remote_permits     += [:id, :first_name, :last_name]
          extend ActsAsRelatingTo

          api_version 'v1'
          
        end
      end

    end

  end
end
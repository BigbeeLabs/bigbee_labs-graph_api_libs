module BigbeeLabs
  module GraphApi
    module Role

      def self.included(base)
        base.class_eval do 
          my_klass.remote_attributes  = [:id, :name, :display_name]
          my_klass.remote_permits     = [:id, :name, :display_name]
          my_klass.remote_requires    = [:name, :display_name]
        end
      end

    end
  end
end
module BigbeeLabs
  module GraphApi

    module Program
      def self.included(base)
        base.class_eval do 

          my_klass.remote_attributes  = [:id, :name, :description, :system_name]
          my_klass.remote_permits     = [:id, :name, :description, :slug]
          my_klass.remote_requires    = [:name, :description, :system_name]
        end
      end
    end

    module ProgramModule
      def self.included(base)
        base.const_set("REMOTE_ATTRIBUTES", [:id, :name, :description, :system_name])
        base.const_set("REMOTE_REQUIRES",   [:name, :description, :system_name])
        base.const_set("REMOTE_PERMITS",    [:id, :name, :description, :slug])
        base.extend ActsAsRelatingTo
      end
    end

  end
end
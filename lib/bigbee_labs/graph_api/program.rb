module BigbeeLabs
  module GraphApi

    class Program < Base

      REMOTE_ATTRIBUTES   = [:id, :name, :description, :system_name]
      REMOTE_REQUIRES     = [:name, :description, :system_name]
      REMOTE_PERMITS      = [:id, :name, :description, :slug]

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
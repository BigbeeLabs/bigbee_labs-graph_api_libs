module BigbeeLabs
  module GraphApi

    class Organization < Base

      REMOTE_ATTRIBUTES   = [:id, :short_name, :full_name, :ein, :description, :code, :created_at, :updated_at, :slug, :resource_owner_id, :errors]
      REMOTE_REQUIRES     = [:full_name, :description, :code]
      REMOTE_PERMITS      = [:id, :short_name, :full_name, :ein, :description, :code, :slug]

    end

    module OrganizationModule
      def self.included(base)
        base.const_set("REMOTE_ATTRIBUTES", [:id, :short_name, :full_name, :ein, :description, :code, :created_at, :updated_at, :slug, :resource_owner_id, :errors])
        base.const_set("REMOTE_REQUIRES",   [:full_name, :description, :code])
        base.const_set("REMOTE_PERMITS",    [:id, :short_name, :full_name, :ein, :description, :code, :slug])
        base.extend ActsAsRelatingTo
      end

    end

  end
end
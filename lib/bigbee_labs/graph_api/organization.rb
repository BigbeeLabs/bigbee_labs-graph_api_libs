module BigbeeLabs
  module GraphApi
=begin
    class Organization < Base

      REMOTE_ATTRIBUTES   = [:id, :short_name, :full_name, :ein, :description, :code, :created_at, :updated_at, :slug, :resource_owner_id, :errors]
      REMOTE_REQUIRES     = [:full_name, :description, :code]
      REMOTE_PERMITS      = [:id, :short_name, :full_name, :ein, :description, :code, :slug]

    end
=end
    module Organization
      def self.included(base)
        @remote_attributes  = [:id, :short_name, :full_name, :ein, :description, :code, :created_at, :updated_at, :slug, :resource_owner_id, :errors]
        @remote_requires    = [:full_name, :description, :code]
        @remote_permits     = [:id, :short_name, :full_name, :ein, :description, :code, :slug]
        
        base.const_set("REMOTE_ATTRIBUTES", [:id, :short_name, :full_name, :ein, :description, :code, :created_at, :updated_at, :slug, :resource_owner_id, :errors])
        base.const_set("REMOTE_REQUIRES",   [:full_name, :description, :code])
        base.const_set("REMOTE_PERMITS",    [:id, :short_name, :full_name, :ein, :description, :code, :slug])
        base.extend ActsAsRelatingTo
        base.extend BigbeeLabs::Associations
      end

    end

  end
end
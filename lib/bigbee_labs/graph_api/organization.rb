module BigbeeLabs
  module GraphApi
    module Organization

      def self.included(base)
        base.class_eval do 
          my_klass.remote_attributes  = [:id, :short_name, :full_name, :ein, :description, :code, :created_at, :updated_at, :slug, :resource_owner_id, :errors]
          my_klass.remote_requires    = [:full_name, :description, :code]
          my_klass.remote_permits     = [:id, :short_name, :full_name, :ein, :description, :code, :slug]
          extend ActsAsRelatingTo
          acts_as_relating_to :programs, class_name: 'BigbeeGraph::Program', remote: true
        end
=begin
        base.const_set("REMOTE_ATTRIBUTES", [:id, :short_name, :full_name, :ein, :description, :code, :created_at, :updated_at, :slug, :resource_owner_id, :errors])
        base.const_set("REMOTE_REQUIRES",   [:full_name, :description, :code])
        base.const_set("REMOTE_PERMITS",    [:id, :short_name, :full_name, :ein, :description, :code, :slug])
        base.extend ActsAsRelatingTo
        base.extend BigbeeLabs::Associations
=end
      end

    end

  end
end
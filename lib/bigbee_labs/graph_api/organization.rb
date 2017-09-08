module BigbeeLabs
  module GraphApi
    module Organization

      def self.included(base)
        base.class_eval do 
          my_klass.remote_attributes  += [:id, :short_name, :full_name, :ein, :description, :code, :created_at, :updated_at, :slug, :resource_owner_id, :errors]
          my_klass.remote_requires    += [:full_name, :description, :code]
          my_klass.remote_permits     += [:id, :short_name, :full_name, :ein, :description, :code, :slug]
          extend ActsAsRelatingTo
          acts_as_having :programs, class_name: 'BigbeeGraph::Program', remote: true
          acts_as_having :groups, class_name: 'BigbeeGraph::Group', remote: true, api_version: '1'

          api_version 'v1'
          
        end
      end

    end

  end
end
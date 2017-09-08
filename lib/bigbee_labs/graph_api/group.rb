module BigbeeLabs
  module GraphApi
    module Group

      def self.included(base)
        base.class_eval do 
          my_klass.remote_attributes  += [:id, :uuid, :display_name, :description, :slug, :created_at, :updated_at, :errors]
          my_klass.remote_requires    += [:display_name, :description, :slug]
          my_klass.remote_permits     += [:id, :display_name, :description, :slug]
          acts_as_administrated_by :people, class_name: 'BigbeeGraph::Person', remote: true, api_version: '1'
        end
      end

    end

  end
end
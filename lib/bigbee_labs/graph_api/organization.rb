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
          # TODO Remove next line? removed the 'api_version' argument. seeing if it works.
          #acts_as_having :groups, class_name: 'BigbeeGraph::Group', remote: true, api_version: '1'
          acts_as_having :groups, class_name: 'BigbeeGraph::Group', remote: true
          # TODO remove or remediate the following line. The idea of a 'Contact' may be a dud. It may be 
          # People or Organizations instead
          #acts_as_having :contacts, class_name: 'BigbeeGraph::Contact', remote: true
          
          acts_as_administrated_by :people, class_name: 'BigbeeGraph::Person', remote: true

          api_version 'v1'
          
        end
      end

    end

  end
end
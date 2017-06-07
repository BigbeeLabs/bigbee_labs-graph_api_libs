#require 'bigbee_labs/graph_api/acts_as/administrating'

module BigbeeLabs
  module GraphApi
    module PersonModule
=begin      
      def self.included(base)
        base.class_eval do 
          
          const_set("REMOTE_ATTRIBUTES", [:id, :first_name, :last_name, :date_of_birth, :created_at, :updated_at, :sex_id, :ethnicity_id, :errors])
          const_set("REMOTE_REQUIRES",   [:first_name, :last_name])
          const_set("REMOTE_PERMITS",    [:id, :first_name, :last_name, :date_of_birth, :sex_id, :ethnicity_id])
          
          extend  ActsAsAdministering
          extend  ActsAsRelatingTo
          extend  ActsAsHaving
          include InstanceMethods
          
          # TODO: remove acts_as_administrating :applications? 
          # It seems weird for it to be here because graph shouldn't know anything about 
          # administrating applications.
          acts_as_administrating :applications,   class_name: "BigbeeAccounts::AppClient",  remote: true
          acts_as_administrating :organizations,  class_name: "BigbeeGraph::Organization",  remote: true
          acts_as_administrating :programs,       class_name: "BigbeeGraph::Program",       remote: true
          #acts_as_having         :health_state,   remote: true
          #acts_as_having         :program_roles,  remote: true
          #acts_as_having         :permissioned_applications, class_name: 'AppCollaborators::AppClient', remote: true

          define_singleton_method(:find) do |id|
            my_klass.resource_owner_id = id
            super id
          end

        end        
      end

      def resource_owner_id
        self.id
      end
=end
    end

    module Person

      def self.included(base)
        base.class_eval do 
#          include BigbeeLabs::GraphApi::Base
#          include BigbeeLabs::GraphApi::PersonModule

          my_klass.remote_attributes  = [:id, :first_name, :last_name, :date_of_birth, :created_at, :updated_at, :sex_id, :ethnicity_id]
          my_klass.remote_permits     = [:id, :first_name, :last_name, :date_of_birth, :sex_id, :ethnicity_id]
          my_klass.remote_requires    = [:first_name, :last_name]
        end
      end

    end

  end
end
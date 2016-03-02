#require 'bigbee_labs/graph_api/acts_as/administrating'

module BigbeeLabs
  module GraphApi
    class Person < Base
      extend BigbeeLabs::GraphApi::ActsAs::Administrating
#      extend BigbeeLabs::GraphApi::ActsAs::Administrating::ClassMethods
#      extend BigbeeLabs::GraphApi::ActsAs::Administrating::MethodBuilders
      extend ActsAsRelatingTo
      extend ActsAsHaving

      REMOTE_ATTRIBUTES   = [:id, :first_name, :last_name, :date_of_birth, :created_at, :updated_at, :sex_id, :ethnicity_id]
      REMOTE_REQUIRES     = [:first_name, :last_name]
      REMOTE_PERMITS      = [:id, :first_name, :last_name, :date_of_birth, :sex_id, :ethnicity_id]

      #acts_as_administrating
      acts_as_administrating :organizations, class_name: "BigbeeGraph::Organization", remote: true
      acts_as_having :health_state, class_name: "BigbeeGraph::HealthState", remote: true

      class << self
        def find(id)
          puts "in #{self}.#{__method__}, id: #{id}"
          my_klass.resource_owner_id = id
          super
        end
      end

      def resource_owner_id
        ret = my_klass.resource_owner_id
        ret ||= self.id
        ret
      end

      def delete
        @options ||= {}
        @options[:resource_owner_id] = self.id
        super
      end

    end
  end
end
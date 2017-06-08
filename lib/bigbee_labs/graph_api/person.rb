#require 'bigbee_labs/graph_api/acts_as/administrating'

module BigbeeLabs
  module GraphApi
    module Person

      def self.included(base)
        base.class_eval do 
          my_klass.remote_attributes  = [:id, :first_name, :last_name, :date_of_birth, :created_at, :updated_at, :sex_id, :ethnicity_id, :errors]
          my_klass.remote_permits     = [:id, :first_name, :last_name, :date_of_birth, :sex_id, :ethnicity_id]
          my_klass.remote_requires    = [:first_name, :last_name]
        end
      end

    end
  end
end
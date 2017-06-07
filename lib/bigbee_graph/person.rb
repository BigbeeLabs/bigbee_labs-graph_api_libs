require_dependency 'bigbee_graph/organization'
require_dependency 'bigbee_graph/program'

class BigbeeGraph::Person < BigbeeGraph::Base
  my_klass.remote_attributes  = [:id, :first_name, :last_name, :date_of_birth, :created_at, :updated_at, :sex_id, :ethnicity_id, :errors]
  my_klass.remote_permits     = [:first_name, :last_name]
  my_klass.remote_requires    = [:id, :first_name, :last_name, :date_of_birth, :sex_id, :ethnicity_id]
  acts_as_administrating :organizations,  class_name: "BigbeeGraph::Organization",  remote: true
  #acts_as_administrating :programs,       class_name: "BigbeeGraph::Program",       remote: true
  
end
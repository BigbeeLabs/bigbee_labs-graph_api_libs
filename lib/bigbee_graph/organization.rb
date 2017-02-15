require_dependency 'bigbee_graph/program'

class BigbeeGraph::Organization < BigbeeGraph::Base
  my_klass.remote_attributes  = [:id, :short_name, :full_name, :ein, :description, :code, :created_at, :updated_at, :slug, :resource_owner_id, :errors]
  my_klass.remote_requires    = [:full_name, :description, :code]
  my_klass.remote_permits     = [:id, :short_name, :full_name, :ein, :description, :code, :slug]
  extend ActsAsRelatingTo
  acts_as_having :programs, class_name: 'BigbeeGraph::Program', remote: true
  
end
require_dependency 'bigbee_graph/person'

class BigbeeGraph::Program < BigbeeGraph::Base
  my_klass.remote_attributes  = [:id, :name, :description, :system_name, :errors]
  my_klass.remote_permits     = [:id, :name, :description, :system_name, :slug]
  my_klass.remote_requires    = [:name, :description, :system_name]

  acts_as_having :enrollees, class_name: "BigbeeGraph::Person", remote: true
end
class BigbeeGraph::EmailAddress < BigbeeGraph::Base
  my_klass.remote_attributes  = [:id, :address, :created_at, :updated_at, :errors]
  my_klass.remote_requires    = [:address]
  my_klass.remote_permits     = [:address]
end
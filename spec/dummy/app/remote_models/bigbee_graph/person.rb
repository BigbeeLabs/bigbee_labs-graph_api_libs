class BigbeeGraph::Person < BigbeeGraph::Base
  include BigbeeLabs::GraphApi::Person

  acts_as_administrating :organizations, class_name: 'FooOrganization', remote: true
  
end
module BigbeeGraph
  class Person
    APP_PROVIDER_NAME = 'bigbee_graph'
    
    include BigbeeLabs::GraphApi::Base
    include BigbeeLabs::GraphApi::Person

    acts_as_administrating :organizations, class_name: 'FooOrganization', remote: true
  end
end
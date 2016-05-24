module BigbeeGraph
  class Person
    include BigbeeLabs::GraphApi::Person

    acts_as_administrating :organizations, class_name: 'FooOrganization', remote: true
  end
end
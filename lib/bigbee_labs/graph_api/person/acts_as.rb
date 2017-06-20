require_dependency 'bigbee_labs/graph_api/person'

module BigbeeLabs::GraphApi::Person::ActsAs
  
    def self.included(base)
      base.class_eval do 
        base.acts_as_administrating :organizations, class_name: "BigbeeGraph::Organization", remote: true
        base.acts_as_having :email_addresses, class_name: "BigbeeGraph::EmailAddress", remote: true
        base.acts_as_having :phone_numbers, class_name: "BigbeeGraph::PhoneNumber", remote: true
        base.acts_as_having :physical_addresses, class_name: "BigbeeGraph::PhysicalAddress", remote: true
      end
    end


end
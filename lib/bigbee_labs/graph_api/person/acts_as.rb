require_dependency 'bigbee_labs/graph_api/person'

module BigbeeLabs::GraphApi::Person::ActsAs
  
    def self.included(base)
      base.class_eval do 
        base.acts_as_administrating :organizations, class_name: "BigbeeGraph::Organization", remote: true
        base.acts_as_administrating :groups, class_name: "BigbeeGraph::Group", remote: true
        base.acts_as_having :email_addresses, class_name: "BigbeeGraph::EmailAddress", remote: true
        base.acts_as_having :phone_numbers, class_name: "BigbeeGraph::PhoneNumber", remote: true
        base.acts_as_having :physical_addresses, class_name: "BigbeeGraph::PhysicalAddress", remote: true
        base.acts_as_relating_to :people, class_name: "BigbeeGraph::Person", remote: true
        base.acts_as_relating_to :organizations, class_name: "BigbeeGraph::Organization", remote: true
        base.acts_as_relating_to :groups, class_name: "BigbeeGraph::Group", remote: true
        base.acts_as_sharing_relationship_invitations_with :people, class_name: 'BigbeeGraph::Person', remote: true
      end
    end

end
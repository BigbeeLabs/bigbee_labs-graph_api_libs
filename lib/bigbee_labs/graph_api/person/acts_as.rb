module BigbeeLabs::GraphApi::Person::ActsAs
  
    def self.included(base)
      base.class_eval do 
        base.acts_as_administrating :organizations, class_name: "BigbeeGraph::Organization", remote: true
      end
    end


end
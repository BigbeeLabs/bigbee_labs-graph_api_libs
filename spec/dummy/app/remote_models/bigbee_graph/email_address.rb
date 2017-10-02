module BigbeeGraph
  class EmailAddress
    APP_PROVIDER_NAME = 'bigbee_graph'
    
    include BigbeeLabs::GraphApi::Base
    include BigbeeLabs::GraphApi::EmailAddress

  end
end
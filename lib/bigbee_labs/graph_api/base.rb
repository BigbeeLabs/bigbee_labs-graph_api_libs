require_dependency 'bigbee_labs/remote_models_base'

module BigbeeLabs
  module GraphApi
    class Base < BigbeeLabs::RemoteModels::Base
      extend BigbeeLabs::Associations::ClassMethods
      #extend BigbeeLabs::GraphApi::ActsAs::Administrating
    end
  end
end
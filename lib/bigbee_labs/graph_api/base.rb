require 'bigbee_labs/remote_models_base'
require 'acts_as_relating_to'

module BigbeeLabs
  module GraphApi
    class Base < BigbeeLabs::RemoteModels::Base
      extend BigbeeLabs::Associations::ClassMethods
      #extend BigbeeLabs::GraphApi::ActsAs::Administrating
      class << self
        attr_accessor :app_provider
      end
    end
  end
end
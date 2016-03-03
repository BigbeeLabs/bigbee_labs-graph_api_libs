require_dependency 'bigbee_labs/remote_models_base'
require_dependency 'acts_as_relating_to'
require_dependency 'acts_as_having'

module BigbeeLabs
  module GraphApi
    #class Base
    class Base < BigbeeLabs::RemoteModels::Base
      REMOTE_BASE = "BigbeeGraph::"
      extend BigbeeLabs::Associations::ClassMethods
      #include ActsAsHaving
      #extend BigbeeLabs::GraphApi::ActsAs::Administrating
      class << self
        attr_accessor :app_provider
      end
    end # Base

    module BaseModule
      def self.included(base)
        base.class_eval do
          extend  BigbeeLabs::RemoteModelsBase::ClassMethods
          include BigbeeLabs::RemoteModelsBase::InstanceMethods
          include BigbeeLabs::HttpActions::ClassMethods
          extend  BigbeeLabs::HttpActions::ClassMethods
          extend ActsAsHaving
        end
        base.set_app_provider('bigbee_graph')
      end
    end # BaseModule

  end
end
#require_dependency 'bigbee_labs/remote_models_base'
require_dependency 'acts_as_relating_to'
require_dependency 'acts_as_having'
require_dependency 'app_collaborators'

module BigbeeLabs
  module GraphApi

    module Base
      def self.included(base)
        base.class_eval do
          include BigbeeLabs::RemoteModels::Base
        end
      end
    end # Base

  end
end
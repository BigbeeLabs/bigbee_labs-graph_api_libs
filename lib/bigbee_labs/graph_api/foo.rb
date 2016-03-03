module BigbeeLabs
  module GraphApi
    module Foo
      def self.included(base)
        base.const_set("REMOTE_ATTRIBUTES", [:id, :errors])
        base.const_set("REMOTE_REQUIRES", [])
        base.const_set("REMOTE_PERMITS", [:id])
      end
    end
  end
end
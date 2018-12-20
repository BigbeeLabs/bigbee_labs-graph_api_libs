module BigbeeLabs
  module GraphApi
    module GroupMethods
      module InstanceMethods
        module JoinMethod

          def join_method
            self.try(:join_method_list).try(:first).try(:to_sym)
          end

        end
      end
    end
  end
end


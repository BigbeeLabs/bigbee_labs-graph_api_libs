module BigbeeLabs
  module GraphApi
    module ActsAs
      module Administrating
        module ClassMethods
          module ActsAsAdministratingOptioned

            def acts_as_administrating_optioned
              options = @args.pop
              class_sym = @args[0].to_sym
              #puts "in #{my_klass}.#{__method__}, class_sym: #{class_sym}"
              acts_as_administrating_base(class_sym, options)
            end
            
          end
        end
      end
    end
  end
end
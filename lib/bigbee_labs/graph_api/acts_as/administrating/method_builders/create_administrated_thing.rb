module BigbeeLabs
  module GraphApi
    module ActsAs
      module Administrating
        module MethodBuilders
          module CreateAdministratedThing

            def create_administrated_thing(class_sym, options={})
              puts "in #{my_klass}.#{__method__}, class_sym: #{class_sym}"
              puts "in #{my_klass}.#{__method__}, options: #{options}"

              define_method("administrated_#{class_sym.to_s.singularize}_with") do |instance_options|

              end

            end

          end
        end
      end
    end
  end
end
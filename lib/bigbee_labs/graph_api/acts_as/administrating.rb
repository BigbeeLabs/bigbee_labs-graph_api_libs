module BigbeeLabs
  module GraphApi
    module ActsAs
      module Administrating

        def acts_as_administrating(*args)
          #puts "in #{my_klass}.#{__method__}, args: #{args}"
          extend ClassMethods
          extend MethodBuilders
          @args = args
          is_array_of_keys?(args) ? acts_as_administrating_simple : acts_as_administrating_optioned
        end

        def define_administrate_method(class_sym, options={})
          #puts "in #{my_klass}.#{__method__}"
          define_method("administrate") do |thing|
            relate_to thing, as: "admin"
          end
        end
        private

        def acts_as_administrating_simple
          #puts "in #{self}.#{__method__}, IS array of keys"
          @args.each{|arg| acts_as_administrating_base arg}
        end



      end
    end
  end
end
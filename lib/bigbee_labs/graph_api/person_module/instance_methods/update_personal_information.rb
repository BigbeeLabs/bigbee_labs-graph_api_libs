module BigbeeLabs
  module GraphApi
    module PersonModule
      module InstanceMethods
        module UpdatePersonalInformation

          def update_personal_information_url
            my_klass.url = "#{self.class::APP_PROVIDER.url}/people/#{self.id}/personal_information"
            my_klass.append_query
          end

          def update_personal_information(args)
            puts "in #{self.class}.#{__method__}, args: #{args}"
            my_klass.called_by = __method__.to_s
            my_klass.query = args
            remote_result = generic("put")
          end
         
        end
      end
    end
  end
end
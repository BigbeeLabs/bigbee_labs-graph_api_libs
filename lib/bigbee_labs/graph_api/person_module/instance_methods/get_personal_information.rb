module BigbeeLabs
  module GraphApi
    module PersonModule
      module InstanceMethods
        module GetPersonalInformation

          def personal_information_url
            my_klass.url = "#{self.class::APP_PROVIDER.url}/people/#{self.id}/personal_information"
            my_klass.append_query("information")
          end

          def personal_information(requested_information)
            my_klass.called_by = __method__.to_s
            my_klass.query = requested_information
            result = generic('get')
          end
          
        end
      end
    end
  end
end
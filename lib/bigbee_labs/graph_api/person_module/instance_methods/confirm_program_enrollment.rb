module BigbeeLabs
  module GraphApi
    module PersonModule
      module InstanceMethods
        module ConfirmProgramEnrollment

          def confirm_program_enrollment_url
            my_klass.url = "#{self.class::APP_PROVIDER.url}/people/#{self.id}/confirm_program_enrollment"
            my_klass.append_query
          end


          def confirm_program_enrollment(args)
            my_klass.called_by = "confirm_program_enrollment"
            my_klass.query = args
            remote_result = generic('get')
          end

          private :confirm_program_enrollment_url
        end
      end
    end
  end
end
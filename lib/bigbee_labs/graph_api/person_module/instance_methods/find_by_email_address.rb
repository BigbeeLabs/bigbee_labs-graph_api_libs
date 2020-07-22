module BigbeeLabs
  module GraphApi
    module PersonModule
      module InstanceMethods
        module FindByEmailAddress

          def find_by_email_address_url
            #@url = "#{self.class::APP_PROVIDER.url}/people/find_by_email_address"
            @url = "#{app_provider.uri.clone}/api/#{api_version}/#{my_object_name.pluralize}/find_by_email_address"

            #my_klass.append_query
            append_query(:email_address)
            @url

          end

          def find_by_email_address(args)
            #my_klass.called_by = "find_by_email_address"
            @query = args
            res = generic('get')
            begin
              res = JSON.parse(res) if res.is_a?(String)
            rescue JSON::ParserError
              res = {"errors" => "Something went wrong on the remote server. Please contact an administrator."}
            end
            return res.map{|r| self.class.new(r)} if res.is_a?(Array)
          end

          private :find_by_email_address_url

        end
      end
    end
  end
end
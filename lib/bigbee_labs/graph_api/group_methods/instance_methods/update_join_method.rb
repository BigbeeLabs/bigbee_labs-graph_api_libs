module BigbeeLabs
  module GraphApi
    module GroupMethods
      module InstanceMethods
        module UpdateJoinMethod

          def update_join_method_url
            @url = "#{app_provider.uri.clone}/api/#{api_version}/"
            @url << "#{my_object_name.pluralize}/#{self.id}/update_join_method"
            append_query
            @url
          end

          def update_join_method(options)
            @called_by = __method__
            @query = options
            remote_result = generic('patch')
            begin
              remote_result = JSON.parse(remote_result) if remote_result.is_a?(String)
            rescue JSON::ParserError
              remote_result = {"errors" => "Something went wrong on the remote server. Please contact an administrator."}
            end
            remote_result = remote_result.with_indifferent_access
            load_instance_variables(remote_result)
            scrub_instance_variables
          end

          private :update_join_method_url

        end
      end
    end
  end
end


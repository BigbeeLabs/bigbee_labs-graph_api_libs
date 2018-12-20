module BigbeeLabs
  module GraphApi
    module Group
      def self.included(base)

        base.class_eval do 
          my_klass.remote_attributes  += %i(id uuid display_name description slug created_at updated_at errors visible_to_role_list join_method_list)
          my_klass.remote_requires    += [:display_name, :description, :slug]
          my_klass.remote_permits     += [:id, :display_name, :description, :slug, :visible_to_role_list]
          
          include BigbeeLabs::GraphApi::GroupMethods::InstanceMethods

          acts_as_administrated_by :people, class_name: 'BigbeeGraph::Person', remote: true
          acts_as_having :members, class_name: 'BigbeeGraph::Person', remote: true
        end

        def update_visible_to_role_list_url
          @url = "#{app_provider.uri.clone}/api/#{api_version}/"
          @url << "#{my_object_name.pluralize}/#{self.id}/visible_to_role_list"
          append_query
          @url
        end

        private :update_visible_to_role_list_url

        def update_visible_to_role_list(options)
          @called_by = __method__
          @query = options
          remote_result = generic('patch')
          begin
            remote_result = JSON.parse(remote_result) if remote_result.is_a?(String)
          rescue JSON::ParserError
            remote_result = {"errors" => "Something went wrong on the remote server. Please contact an administrator."}
          end
          remote_result = remote_result.with_indifferent_access
          load_instance_variables(remote_result.slice(:visible_to_role_list))
          scrub_instance_variables
        end

      end
    end
  end
end
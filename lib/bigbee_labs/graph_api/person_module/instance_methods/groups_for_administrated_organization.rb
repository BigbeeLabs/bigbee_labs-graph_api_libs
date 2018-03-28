module BigbeeLabs
  module GraphApi
    module PersonModule
      module InstanceMethods
        module GroupsForAdministratedOrganization

          def groups_for_administrated_organization_url
            @url = "#{app_provider.uri.clone}/api/#{api_version}/people/#{self.id}/"
            @url << "administrated_organizations/#{@organization_id}/administrated_groups"
          end

          def groups_for_administrated_organization(args)
            if args.is_a?(BigbeeLabs::GraphApi::Organization)
              @organization_id = args.id
              @result_klass = args.class.name.split('::')
            elsif args.is_a?(Fixnum)
              @organization_id = args
              @result_klass = self.class.name.split('::')
            else
              return  {error: "Don't know how to process a #{args.class.name}"}
            end
            @result_klass.pop
            begin
              @result_klass = @result_klass.send(:<<, "Group").join('::').constantize
            rescue NameError
              return {error: "No class constant named #{result_klass.join('::')}"}
            end
            generic('get').tap do |remote_results|
              return remote_results.map{|remote_result| @result_klass.new(remote_result)}
            end

          end

          private :groups_for_administrated_organization_url

        end
      end
    end
  end
end
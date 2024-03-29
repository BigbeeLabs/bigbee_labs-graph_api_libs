module BigbeeLabs
  module GraphApi
    module Person

      def self.included(base)

        base.class_eval do 
          my_klass.remote_attributes  += [:id, :first_name, :last_name, :date_of_birth, :created_at, :updated_at, :sex_id, :ethnicity_id, :errors, :search_matches]
          my_klass.remote_permits     += [:id, :first_name, :last_name, :date_of_birth, :sex_id, :ethnicity_id]
          my_klass.remote_requires    += [:first_name, :last_name]
          
          include BigbeeLabs::GraphApi::PersonModule::InstanceMethods

          acts_as_relating_to :groups, class_name: 'BigbeeGraph::Group', remote: true
        end

        def public_profile_url
          @url = app_provider.url.clone
          self.class.name.demodulize.downcase.pluralize.tap do |x|
            @url << "/#{x}/#{self.id}"
          end
          @url << "/public_profile"
          append_query
        end

        def public_profile
          @called_by = __method__.to_s
          generic('get')
        end

        def using_token
          set_token unless (@credential and @credential[:token])
          self
        end

        def full_name
          "#{self.first_name} #{self.last_name}"
        end

        def first_name_last
          "#{self.last_name}, #{self.first_name}"
        end
        
        def set_token
          @credential = {token: access_token.token} if access_token
        end

        def access_token
          @access_token ||= AppCollaborators::AccessToken.find_by(resource_owner_id: self.id)
        end

        private :public_profile_url
        private :set_token
        private :access_token

      end

    end
  end
end
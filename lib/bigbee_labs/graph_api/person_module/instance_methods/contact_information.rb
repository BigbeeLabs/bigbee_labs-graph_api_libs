module BigbeeLabs
  module GraphApi
    module PersonModule
      module InstanceMethods
        module ContactInformation

          def contact_information_url
            @url = app_provider.uri.clone << "/api/" << api_version
            self.class.name.demodulize.downcase.pluralize.tap do |x|
              @url << "/#{x}/#{self.id}"
            end
            @url << "/contact_information"
            append_query
          end


          def contact_information
            @called_by = __method__.to_s
            generic('get').tap do |result|
              puts "#{self.class}.#{__method__}, result:"<<" #{result}".red
            end
          end

          private :contact_information_url

        end
      end
    end
  end
end
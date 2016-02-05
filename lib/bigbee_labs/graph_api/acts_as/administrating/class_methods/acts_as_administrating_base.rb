module BigbeeLabs
  module GraphApi
    module ActsAs
      module Administrating
        module ClassMethods
          module ActsAsAdministratingBase

            def acts_as_administrating_base(class_sym, options={})
              acts_as_relating_to class_sym

              define_administrate_method(class_sym, options)
              define_administrated_things_method class_sym, options
              define_administrated_thing_with_method class_sym, options
              
              define_method("create_administrated_#{class_sym.to_s.singularize}_url") do
                object = my_object_name.pluralize
                id = self.id
                method = "administrate/#{class_sym.to_s.singularize}"
                my_klass.url = "#{self.class::APP_PROVIDER.url}/#{object}/#{id}/#{method}?#{query}"
              end


              define_method("create_administrated_#{class_sym.to_s.singularize}") do |instance_options|
                my_klass.called_by = "create_administrated_#{class_sym.to_s.singularize}"
                my_klass.query = instance_options.to_query("#{class_sym.to_s.singularize}")
                res = generic('post')
                begin
                  res = JSON.parse(res) if res.is_a?(String)
                rescue JSON::ParserError
                  res = {"errors" => "Something went wrong on the remote server."}
                end
                return_klass = options[:class_name] ? options[:class_name].constantize : class_sym.camelize.constantize
                if return_klass.is_a?(ActiveRecord::Base) # this is an ActiveRecord object
                  unless res['errors'] # and there are no errors
                    res = return_klass.new(res)
                  else # and there are errors
                    raise "in create_administrated_#{class_sym.to_s.singularize}"
                  end
                else # this is not an ActiveRecord object
                  res = return_klass.new(res)
                end
                return res
              end
            end
            
          end
        end
      end
    end
  end
end
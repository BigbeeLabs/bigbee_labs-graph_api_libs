module BigbeeLabs
  module GraphApi
    module ActsAs
      module Administrating
        module MethodBuilders
          module AdministratedThingWith

            def define_administrated_thing_with_method(class_sym, options={})
              #puts "in #{my_klass}.#{__method__}, class_sym: #{class_sym}"
              #puts "in #{my_klass}.#{__method__}, options: #{options}"

              define_method("administrated_#{class_sym.to_s.singularize}_with_url") do
                my_klass.url = "#{self.class::APP_PROVIDER.url}/#{my_object_name.pluralize}/#{self.id}/administrated/#{class_sym.to_s.singularize}?#{query}"
              end

              define_method("administrated_#{class_sym.to_s.singularize}_with") do |instance_options|
                #puts "in #{my_klass}.#{__method__}, instance_options: #{instance_options}"
                other_klass = options[:class_name] ? options[:class_name].constantize : class_sym.to_s.camelize.singularize.constantize
                other_klass_ids = owned_relationships.tagged_with('admin').where(in_relation_to_type: other_klass.name).map{|rel| rel.in_relation_to_id}
                if options[:remote]
                  my_klass.called_by = "administrated_#{class_sym.to_s.singularize}_with"
                  my_klass.query = instance_options.to_query(class_sym.to_s.singularize)
                  res = generic('get')
                  #puts "in #{my_klass}.#{__method__}, res.class: #{res.class}"
                  unless res["errors"]
                    res = other_klass.new(res)
                  end
                  res
                  #raise "in #{my_klass}.administrated_#{class_sym.to_s}"
                else
                  other_klass.where(id: other_klass_ids)
                end
              end

            end

          end
        end
      end
    end
  end
end
module BigbeeLabs
  module GraphApi
    module ActsAs
      module Administrating
        module MethodBuilders
          module AdministratedThings

            def define_administrated_things_method(class_sym, options={})
              #puts "in #{my_klass}.#{__method__}, class_sym: #{class_sym}"

              define_method("administrated_#{class_sym.to_s}_url") do 
                my_klass.url = "#{self.class::APP_PROVIDER.url}/#{my_object_name.pluralize}/#{self.id}/administrated/#{class_sym.to_s}"
              end
              
              define_method("administrated_#{class_sym.to_s}") do
                #puts "in #{my_klass}.#{__method__}"
                other_klass = options[:class_name] ? options[:class_name].constantize : class_sym.to_s.camelize.singularize.constantize
                other_klass_ids = owned_relationships.tagged_with('admin').where(in_relation_to_type: other_klass.name).map{|rel| rel.in_relation_to_id}
                if options[:remote]
                  my_klass.called_by = "administrated_#{class_sym.to_s}"
                  res = generic('get')
                  if res.is_a?(Array)
                    ret = []
                    res.each do |item|
                      ret << other_klass.new(item)
                    end
                    res = ret
                  end
                  res
                  #raise "in #{my_klass}.administrated_#{class_sym.to_s}"
                else
                  other_klass.where(id: other_klass_ids)
                end
              end

              private "administrated_#{class_sym.to_s}_url".to_sym

            end

          end
        end
      end
    end
  end
end
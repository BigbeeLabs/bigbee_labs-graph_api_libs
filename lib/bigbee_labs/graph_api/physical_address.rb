module BigbeeLabs::GraphApi::PhysicalAddress

  def self.included(base)
    base.class_eval do  
      my_klass.remote_attributes  = [:id, :line_1, :line_2, :line_3, :city, :country_subdivision_code, :postal_code, :lat, :long, :created_at, :updated_at, :errors]
      my_klass.remote_requires    = [:line_1, :city, :country_subdivision_code, :postal_code]
      my_klass.remote_permits     = [:line_1, :line_2, :line_3, :city, :country_subdivision_code, :postal_code, :lat, :long]
    end
  end

end
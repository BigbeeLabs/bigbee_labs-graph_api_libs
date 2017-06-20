module BigbeeLabs::GraphApi::PhoneNumber

  def self.included(base)
    base.class_eval do  
      my_klass.remote_attributes  = [:id, :number, :created_at, :updated_at, :errors]
      my_klass.remote_requires    = [:number]
      my_klass.remote_permits     = [:number]
    end
  end

end
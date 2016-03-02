module BigbeeLabs
  module GraphApi
    class Program < Base

      REMOTE_ATTRIBUTES   = [:id, :name, :description, :system_name]
      REMOTE_REQUIRES     = [:name, :description, :system_name]
      REMOTE_PERMITS      = [:id, :name, :description, :slug]

    end
  end
end
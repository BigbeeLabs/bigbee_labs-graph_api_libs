module BigbeeLabs
  module GraphApi
    class EmailAddress < Base

      REMOTE_ATTRIBUTES   = [:id, :address, :create_ad, :updated_at]
      REMOTE_REQUIRES     = [:address]
      REMOTE_PERMITS      = [:address]

    end
  end
end
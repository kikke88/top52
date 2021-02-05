module Statistics
  class ApplicationController < ActionController::Base
    layout "layouts/statistics/admin"

    before_action :authorize_admins

    def authorize_admins
      authorize!(:access, :admin)
    end
  end
end

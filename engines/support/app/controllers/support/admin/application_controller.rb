module Support
  class Admin::ApplicationController < ApplicationController
    layout "layouts/support/admin"

    before_action :authorize_admins

    def authorize_admins
      authorize!(:access, :admin) && authorize!(:manage, :tickets)
    end
  end
end

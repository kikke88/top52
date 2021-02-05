module Announcements
  class Admin::ApplicationController < ApplicationController
    before_action :authorize_admins

    def authorize_admins
      authorize! :access, :admin
    end
  end
end

class LogoutController < ApplicationController
  def index
  end

  def dsestroy
    reset_session
    redirect_to root_path
  end

end

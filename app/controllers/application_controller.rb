class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :carts
  private

  def after_sign_in_path_for(resource)
    "/myprofile"
  end

  def carts
    @cart = session[:cart] || {}
  end
end

def ensure_admin
  unless current_user && current_user.admin?
    redirect_to "/"
    flash[:error] = "You need to be an admin to do that"
  end
end

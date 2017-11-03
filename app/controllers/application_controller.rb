class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_path, alert: "Not authorized - you must be logged in!" if current_user.nil?
  end

  def authorize_edit
    content = controller_name.classify.constantize.find(params[:id])
    redirect_to campground_path(content.campground) if current_user != content.user
  end
end

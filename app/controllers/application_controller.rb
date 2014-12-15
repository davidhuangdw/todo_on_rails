class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  respond_to :html, :json, :js
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(auth_token:session[:auth_token])
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  respond_to :html, :json, :js
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(auth_token:session[:auth_token])
  end

  def require_login
    redirect_to root_url, alert:'Require login first.' unless current_user
  end

  def store_location(location=request.referer)
    session[:return_to] = location
  end
  def redirect_back_or_default(default, *args)
    redirect_to(session.delete(:return_to) || default, *args)
  end
end

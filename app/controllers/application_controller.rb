class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  respond_to :html, :json, :js

  helper_method :current_user
  def current_user
    @current_user ||= User.find_by(auth_token:session[:auth_token])
  end

  include RestrictAccess
  include RedirectBack

  def track_event(trackable, project_id, action:params[:action], detail:'')
    current_user.events.create! action:action, trackable:trackable, project_id:project_id, detail:detail
  end
end

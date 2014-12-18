class ApplicationController
  module RestrictAccess
    def require_login
      redirect_to root_url, alert:'Require login first.' unless current_user
    end

    def require_current_team
      require_login
      redirect_to user_switch_team_path(current_user) unless current_user.current_team
    end
  end
end
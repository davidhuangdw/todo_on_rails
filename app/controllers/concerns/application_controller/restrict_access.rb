class ApplicationController
  module RestrictAccess
    def require_login
      redirect_to root_url, alert:'Require login first.' unless current_user
    end

    def require_current_team
      require_login
      redirect_to user_switch_team_path(current_user) unless current_user.current_team
    end

    def allow(record, action)
      @access.send(action, current_user, record)
    end

    private
    def access_instance(record)
      @access ||= access_class(record.try(:class)).new
    end
    def access_class(model=nil)
      model ||= params[:controller].singularize
      (model.to_s.camelcase + 'Access').constantize
    end
  end
end
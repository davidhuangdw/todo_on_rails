class UsersController
  module CurrentTeam
    def open_team
      @user = User.find(params[:user_id])
      redirect_to @user.current_team ?
        team_path(@user.current_team) :
        user_switch_team_path(@user)
    end

    def switch_team
      @user = current_user
    end
  end
end
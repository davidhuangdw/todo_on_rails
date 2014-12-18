class EventsController < ApplicationController
  def index
    require_login
    current_user.current_team.tap do |team|
      if team
        redirect_to team_events_path(team)
      else
        store_location!(events_path)
        redirect_to user_switch_team_path(current_user),
                    alert:'Choose a current team first:'
      end
    end
  end
end

class TeamsController
  module Eventable
    def events
      @team = Team.includes(projects: {events: [:trackable, :user, comment: :todo]}).find(params[:team_id])
      @events = @team.all_projects_events.sort do |x,y|
        [y.created_at, y.project_id] <=> [x.created_at, x.project_id]
      end
      @events = @events.group_by(&:create_date).map do |date,events|
        {date => events.group_by(&:project)}
      end.reduce({}, :merge!)
    end
  end
end
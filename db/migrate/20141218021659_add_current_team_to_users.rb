class AddCurrentTeamToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :current_team, index: true
  end
end

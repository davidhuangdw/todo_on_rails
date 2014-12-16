class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :team, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

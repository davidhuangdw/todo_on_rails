class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
      t.boolean :important
      t.datetime :complete_time
      t.integer :comment_count, default:0, null:false

      t.timestamps
    end
  end
end

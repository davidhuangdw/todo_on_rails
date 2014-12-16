class AddCommentsCountToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :comments_count, :integer, default: 0, null: false
    remove_column :todos, :comment_count, :integer, default: 0, null: false
  end
end

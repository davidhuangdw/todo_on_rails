class AddCompleteUserToTodos < ActiveRecord::Migration
  def change
    add_reference :todos, :complete_user, index: true
  end
end

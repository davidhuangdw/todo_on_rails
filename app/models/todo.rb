class Todo < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :complete_user, class_name:'User'

  def completed=(val)
    self.complete_time = val ?
        Time.current : nil
  end
  def completed; !!complete_time end
  def adjust_user(current_user)
    update(complete_user_id:current_user.id) if completed
  end

end

class Todo < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :complete_user, class_name:'User'
  has_many :comments, dependent: :destroy

  def completed=(val)
    self.complete_time = (val && val!='false' ?
        Time.current : nil)
  end
  def completed; !!complete_time end
  def adjust_user(current_user)
    update(complete_user_id:current_user.id) if completed
  end
  def html_id; "todo#{id}" end
  def html_title; html_id end

end
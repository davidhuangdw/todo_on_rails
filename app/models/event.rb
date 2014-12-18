class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true
  belongs_to :project

  def create_date
    created_at.strftime("%-m/%d")
  end
  def create_time
    created_at.strftime("%H:%M")
  end
end

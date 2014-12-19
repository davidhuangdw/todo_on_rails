class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :trackable, polymorphic: true
  belongs_to :comment, ->{includes(:tracking_events).where(events:{trackable_type: 'Comment'})}, foreign_key: :trackable_id

  def create_date
    created_at.strftime("%-m/%d")
  end
  def create_time
    created_at.strftime("%H:%M")
  end
end

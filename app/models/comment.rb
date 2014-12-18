class Comment < ActiveRecord::Base
  belongs_to :todo, counter_cache: true
  belongs_to :user
  # has_many :tracking_events, class_name:'Event', as: :trackable, dependent: :destroy

  def html_id
    "comment#{id}"
  end
end

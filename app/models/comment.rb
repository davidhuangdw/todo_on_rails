class Comment < ActiveRecord::Base
  belongs_to :todo, counter_cache: true
  belongs_to :user

  def html_id
    "comment#{id}"
  end
end

class Project < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :team
  has_many :todos, dependent: :destroy
  has_many :events, dependent: :destroy

  def complete_todos; todos.select(&:completed).sort_by(&:complete_time) end
  def incomplete_todos; todos.reject(&:completed).sort_by(&:created_at).reverse end
  def html_id; "project#{id}" end
  def html_title; "Project: #{name}" end
end

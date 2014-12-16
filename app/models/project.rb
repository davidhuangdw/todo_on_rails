class Project < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :team
  has_many :todos
end

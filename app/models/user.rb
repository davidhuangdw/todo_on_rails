class User < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :teams, through: :memberships
  has_many :todos
  has_many :complete_todos, class_name:'Todo', foreign_key: :complete_user_id
  has_many :comments, dependent: :destroy

  include Validatable
  has_secure_password

  include Tokenable
  before_create :generate_token

  def create_team(team_params, role:'admin')
    Team.create(team_params).tap do |team|
      memberships.create(team:team, role:role)
    end
  end
end


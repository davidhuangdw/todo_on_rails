class Membership < ActiveRecord::Base
  ROLES = %w[admin participant external]
  belongs_to :team
  belongs_to :user

  validates :role, inclusion: ROLES
  validates :user_id, :team_id, presence:true
  validates :user_id, uniqueness: {scope: :team_id}
  # ROLES.each do |role|
  #   define_method("#{role}?") {self.role == role}
  #   scope role, ->{where(role:role)}
  # end
end

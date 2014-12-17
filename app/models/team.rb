class Team < ActiveRecord::Base
  validates :name, presence:true

  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user
  Membership::ROLES.each do |role|        #roles: admin, participant, external...
    has_many "#{role.pluralize}".to_sym, ->{where(memberships:{role:role})}, through: :memberships, source: :user
  end

  has_many :projects, dependent: :destroy

  include MemberManagement
  def html_title; "Team: #{name}" end
end


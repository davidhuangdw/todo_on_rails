class MembershipSerializer < ActiveModel::Serializer
  attributes :id
  has_one :team
  has_one :user
end

class EventSerializer < ActiveModel::Serializer
  attributes :id, :action
  has_one :user
  has_one :trackable
end

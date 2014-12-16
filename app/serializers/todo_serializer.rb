class TodoSerializer < ActiveModel::Serializer
  attributes :id, :name, :important, :complete_time, :comment_count
  has_one :project
  has_one :user
end

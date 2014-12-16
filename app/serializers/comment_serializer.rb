class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :todo
  has_one :user
end

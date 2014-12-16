class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :team
end

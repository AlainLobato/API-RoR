class UserSerializer::UsersSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :age

  has_many :tasks, serializer: TaskzSerializer::IndexSerializer
end

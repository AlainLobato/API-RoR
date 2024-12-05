class TaskzSerializer::IndexSerializer < ActiveModel::Serializer
  attributes :id, :task, :complete, :created_on, :finished_on, :user_id
  
end

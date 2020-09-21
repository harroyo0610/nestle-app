class RoomMessageSerializer < ActiveModel::Serializer
  attributes :id, :message, :created_at, :user

  def user
    object.user
  end
end 
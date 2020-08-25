class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_for room
  end

  def room
    binding.pry
    Room.find(params[:room_id])
  end
end
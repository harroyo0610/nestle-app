class RoomChannel < ApplicationCable::Channel
  def subscribed
    binding.pry
    room = Room.find(params[:id])
    stream_from room
  end
end
class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @room_message = RoomMessage.create user: current_user, room: @room, message: params.dig(:room_message, :message)
    
    
    RoomChannel.broadcast_to(@room, @room_message)

      # if @room_message.save
      #   redirect_to @room
      # else
      #   redirect_to @room
      # end
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
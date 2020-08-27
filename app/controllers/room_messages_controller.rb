class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @room_message = RoomMessage.create user: current_user, room: @room, message: params.dig(:room_message, :message)
    
    if @room_message.save
      ActionCable.server.broadcast 'room_channel', content: @room_message
    end
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
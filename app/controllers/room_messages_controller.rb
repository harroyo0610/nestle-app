class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
    RoomChannel.broadcast_to @room, @room_message

    respond_to do |format|
      if @room_message.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.js
        format.json { render json: @room, status: :created, location: @room }
      else
        format.html { render action: "show" }
        format.json { render json: @room_message.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
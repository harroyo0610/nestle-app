module Api
    class RoomsController < ApplicationController

        def show
            room = Room.find(params[:id]) 
            room_messages = room.room_messages.includes(:user)

            render json: room_messages
        end
    end
end
class RoomsController < ApplicationController
  MUX_TOKEN_ID='38830a22-7b79-4ceb-ada2-fe961b0516ba'
  MUX_TOKEN_SECRET='XBEpTKeFj/X+j8/xYAu1AHkZ+qTlHwKDDzTNi47KFr6g1XvNnGK+ql3UoiJhtydyyFrHWqZS44o'

  # Loads:
  # @rooms = all rooms
  # @room = current room when applicable
  before_action :load_entities

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new permitted_parameters

    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update_attributes(permitted_parameters)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
  end

  protected

  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:room).permit(:name)
  end
end
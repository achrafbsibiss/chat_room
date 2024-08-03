class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[edit update destroy]

  def index
    @room = Room.new
    @rooms = Room.public_room
    @users = User.all_except(current_user)
  end

  def edit; end

  def create
    @room = Room.create(set_params)
  end

  def update
    if @room.update(set_params)
      flash.now[:notice] = 'succes'
      redirect_to rooms_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy; end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def set_params
    params.require(:room).permit(:name, :is_private)
  end
end

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    @current_user = current_user
    @users = User.all_except(@current_user)

    @rooms = Room.public_room
    @room_name = get_name(@current_user, @user)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, @current_user], @room_name)

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
    render 'rooms/index'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def get_name(user_1, user_2)
    user = [user_1, user_2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end
end

module MessagesHelper
  def message_position(present_user, message)
    position = present_user && message.user_id == current_user.id
    position ? 'text-right' : 'text-left'
  end
end

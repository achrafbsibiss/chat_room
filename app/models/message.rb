class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_create_commit { broadcast_append_to self.room}

  after_create_commit do
    broadcast_append_to "messages_#{self.room_id}", target: "messages_#{self.room_id}", locals: { current_user: self.user }
  end
end

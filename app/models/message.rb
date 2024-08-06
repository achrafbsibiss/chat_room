class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  before_create :confirm_participant
  after_create_commit { broadcast_append_to room }

  def confirm_participant
    return unless room.is_private

    is_participant = Participant.where(user_id: user.id, room_id: room.id).first
    Rails.logger.debug "Participant check: #{is_participant}"
    throw :abort unless is_participant
  end
end

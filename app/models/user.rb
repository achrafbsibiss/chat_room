class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_one_attached :avatar
  has_many :participants, dependent: :destroy

  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to 'users' }
  after_update_commit :broadcast_status_user

  def avatar_url_of_default
    if avatar.attached?
      Rails.application.routes.url_helpers.rails_blob_url(
        avatar, only_path: true
      )
    else
      'users/user.png'
    end
  end

  def online?
    updated_at > 2.minutes.ago
  end

  def full_name
    "#{user.first_name} #{user.lasr_name}".uprcase
  end

  private

  def broadcast_status_user
    broadcast_replace_to 'users'
  end
end

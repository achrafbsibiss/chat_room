class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :update_user_online, if: :user_signed_in?
  after_action :authenticate_user!

  private

  def update_user_online
    current_user.try :touch
  end
end

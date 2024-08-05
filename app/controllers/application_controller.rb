class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :authenticate_user!
end

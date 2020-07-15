class ApplicationController < ActionController::API
  # acts_as_token_authentication_handler_for User, fallback: :none

  # def current_user
  #   # binding.pry
  #   @current_user ||= User.find(payload['user_id'])
  # end

end

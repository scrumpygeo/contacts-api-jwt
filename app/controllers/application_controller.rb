class ApplicationController < ActionController::API
  # acts_as_token_authentication_handler_for User, fallback: :none

  def current_user
    @current_user || = User.find(payload['user_id'])
  end

  private

  def payload 
    JWT.decode get_token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256 '}
  end

  def get_token
    request.headers['Authorization'].split(' ').last 
  end

end

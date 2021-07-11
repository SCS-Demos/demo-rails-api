# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ResponseRequest
  include ExceptionHandler
  include Pundit

  before_action :authorize_request

  attr_accessor :current_user

  protected

  def authorize_request
    user_id = decoded_auth_token[:user_id]
    stored_data = $redis_memcached_client.get("users:#{user_id}:#{http_auth_header}")
    if stored_data
      user_token = MyJwt.decode(stored_data)
      user = User.find(user_id) if user_id == user_token[:user_id]
    end
    @current_user ||= user
    json_response({ message: I18n.t('authenticate.unauthorized') }, :unauthorized) if @current_user.nil?
  end

  def decoded_auth_token
    @decoded_auth_token ||= MyJwt.decode(http_auth_header)
  end

  def http_auth_header
    request.headers['Authorization'].split.last if request.headers['Authorization'].present?
  end
end

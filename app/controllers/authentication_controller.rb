# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: [:sign_in]

  # # POST /auth/sign_in
  def sign_in
    user = User.find_by(email: login_params[:email])

    if user&.authenticate(login_params[:password])
      token = MyJwt.encode(user_id: user.id)
      $redis_memcached_client.set("users:#{user.id}:#{token}", token)
      json_response(token: token, message: I18n.t('authenticate.sign_in.success'), user: user_response(user))
    else
      json_response({ message: I18n.t('authenticate.sign_in.invalid_credentials') }, :unprocessable_entity)
    end
  end

  # DELETE /auth/sign_out
  def sign_out
    $redis_memcached_client.del("users:#{current_user.id}:#{http_auth_header}")
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def user_response(user)
    UserSerializer.new(user)
  end
end

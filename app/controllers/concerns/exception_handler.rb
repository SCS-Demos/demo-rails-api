# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  class UnauthorizeError < StandardError; end

  included do
    rescue_from StandardError, with: :render_error
    # Define custom handlers
    rescue_from ExceptionHandler::UnauthorizeError, with: :unauthorized_request

    rescue_from Pundit::NotAuthorizedError, with: :render_policy

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end
    rescue_from ActiveRecord::RecordInvalid, with: :render_error
  end

  private

  # JSON response with message; Status code 422 - unprocessable entity
  def render_policy
    json_response({ message: I18n.t('authenticate.forbidden_access') }, :forbidden)
  end

  # JSON response with message; Status code 422 - unprocessable entity
  def render_error(err)
    json_response({ message: err }, :unprocessable_entity)
  end

  def unauthorized_request(err)
    puts err
    json_response({ message: I18n.t('authenticate.unauthorized') }, :unauthorized)
  end
end

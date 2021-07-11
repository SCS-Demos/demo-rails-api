# frozen_string_literal: true

module ResponseRequest
  extend ActiveSupport::Concern

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  # default 422
  def error_response(messages, status = :unprocessable_entity)
    render json: { messages: messages }, status: status
  end
end

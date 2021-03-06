class MyJwt
  SECRET = Rails.application.credentials.secret_key_base

  def self.encode(payload, exp = 1.weeks.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, SECRET)[0]
    HashWithIndifferentAccess.new body
  rescue JWT::DecodeError => e
    raise ExceptionHandler::UnauthorizeError, e.message
  end
end

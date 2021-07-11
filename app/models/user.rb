# frozen_string_literal: true

class User < ApplicationRecord
  include EnumValues::UserType
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_destroy :remove_session

  private

  def remove_session
    keys = $redis_memcached_client.keys("users:#{id}*")
    $redis_memcached_client.del(*keys) unless keys.empty?
  end
end

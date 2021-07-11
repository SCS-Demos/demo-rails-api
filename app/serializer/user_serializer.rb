# frozen_string_literal: true

class UserSerializer < BaseSerializer
  set_type :user

  attributes :name, :email, :user_type
end

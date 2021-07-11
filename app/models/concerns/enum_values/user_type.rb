module EnumValues
  module UserType
    extend ActiveSupport::Concern
    included do
      enum user_type: {
        admin: 'admin',
        operator: 'operator'
      }, _default: 'operator'
    end
  end
end

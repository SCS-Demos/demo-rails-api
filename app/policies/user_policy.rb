class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  # can not destroy ownself
  def destroy?
    index? && user.id != record.id
  end
end

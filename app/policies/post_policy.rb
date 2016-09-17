class PostPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
     scope.all
    end
  end

  def show?
    true
  end

  def new

  end

  def create?
    user == user
  end

  def update?
    user.admin? if user
  end

  def destroy?
    record.user == user || user.admin
  end

  private

  def user_is_owner_or_admin?
    user == user || user.admin
  end
end

class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end


  def create?
    return true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy
    user.admin? if user
  end

  private

  def user_is_owner_or_admin?
    user == user || user.admin?
  end
end

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
    user_is_owner_or_admin?
  end

  def update?
    user.admin
  end

  def destroy
    user.admin
  end

  private

  def user_is_owner_or_admin?
    user == user || user.admin
  end
end

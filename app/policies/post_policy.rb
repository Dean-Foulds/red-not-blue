class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    true
  end

  def update?
    user_is_owner_or_admin?
    #this needs to be changed to an if else to differentiate between an update on comment or post
    #a user can edit a comment but not a post
  end

  def new?
    user.admin
  end

  def create?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user == user || user.admin
  end
end

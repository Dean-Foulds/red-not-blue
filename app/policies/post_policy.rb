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
    if @comment
      user_is_owner_or_admin?
    else
    user.admin
    end
    # if @comment
    # user_is_owner_or_admin?
    # end
    #this needs to be changed to an if else to differentiate between an update on comment or post
    #a user can edit a comment but not a post
  end


  def create?
    if @comment
      user_is_owner_or_admin?
    else
    user.admin
    end
  end

  private

  # def admin_user?
  #   user == user.admin
  # end

  def user_is_owner_or_admin?
    user == user || user.admin
  end
end

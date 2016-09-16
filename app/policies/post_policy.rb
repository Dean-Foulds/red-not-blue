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

  def update?
    user.admin? if user
  end
    # if @comment
    # user_is_owner_or_admin?
    # end
    #this needs to be changed to an if else to differentiate between an update on comment or post
    #a user can edit a comment but not a post



  def create?
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

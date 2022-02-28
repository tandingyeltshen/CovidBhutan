class TestresultPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  def index?
    false
  end
  def new?
    @user.has_role? :user
  end
  def create?
    @user.has_role? :user
  end
  def update?
    false
  end
  def destroy?
    create?
  end
end

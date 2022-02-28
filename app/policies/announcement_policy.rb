class AnnouncementPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  def index?
    @user.has_role? :admin
  end
  def new?
    @user.has_role? :admin
  end
  def edit?
    new?
  end
  def create?
    @user.has_role? :admin
  end
  def update?
    create?
  end
  def destroy?
    create?
  end
end

class PatientPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  def index?
    @user.has_role? :user
  end
  def show?
    @user.has_role? :user
  end
  def new?
    @user.has_role? :user
  end

  def edit?
    @user.has_role? :user
  end

  def create?
    @user.has_role? :user
  end

  def update?
    edit?
  end
  def destroy?
    create?
  end
  def transfer?
    create?
  end
  def transferrequest?
    transfer?
  end
  def requesttransfer?
    transfer?
  end
  def requesttransferupdate?
    transfer?
  end
  def requesttransfercancle?
    transfer?
  end

  def patientdetails?
    @user.has_role? :admin
  end
  
end

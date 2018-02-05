class ChallengePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  def invite?
    user_is_owner?
  end

  private

  def user_is_owner?
    user == record.user
  end
end

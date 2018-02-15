class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(recipient: user)
    end
  end

  def update?
    # user == record.user
    true
  end
end

class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # Only restaurant owner can update
    record.user == user
  end

  def create?
    # Any logged in can create a restaurant
    !user.nil?
  end

  def destroy?
    update?
  end
end

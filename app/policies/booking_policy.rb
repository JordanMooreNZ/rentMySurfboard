class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user).or(scope.where(surfboard: user.surfboards))
      # if user.admin?
      #   scope.all
      # else
      #   scope.where(available: true)
      # end
    end

    # def my_boards
    #   scope.where(user: user)
    # end
  end

  def create?
    !!user
  end

  def update?
    user.surfboards.include?(record.surfboard)
  end

  def edit?
    update?
  end
end

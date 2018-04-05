class SurfboardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(available: true).or(scope.where.not(latitude: nil, longitude: nil))
      # if user.admin?
      #   scope.all
      # else
      #   scope.where(available: true)
      # end
    end

    def my_boards
      scope.where(user: user)
    end
  end

  def create?
    !!user
  end

  def update?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end

  def show?
    record.available || record.user == user
  end

  def edit?
    record.user == user
  end

end

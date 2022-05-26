class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy
    true
  end

  def approve_status?
    true
  end

  def reject_status?
    true
  end
end

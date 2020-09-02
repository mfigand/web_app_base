# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    default_policy
    record == user
  end

  def edit?
    default_policy
    record == user
  end

  private

  def default_policy
    return true if user.superadmin?
  end
end

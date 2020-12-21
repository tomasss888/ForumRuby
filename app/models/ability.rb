# frozen_string_literal: true

# Role model. Used to check if connected used is admin
class Ability
  include CanCan::Ability

  # assign actions based on if hes an admin
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
    end
  end
end

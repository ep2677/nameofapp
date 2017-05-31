class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest user (not logged in)
    if user.admin?
      can :destroy, Comment 
    else
      can :manage, User, id: user.id
  end
end

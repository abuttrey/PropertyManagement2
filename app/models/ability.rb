class Ability
  include CanCan::Ability
  
  def initialize(thisuser)
    can :manage, :all
    
  end
end
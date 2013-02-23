class Ability
  include CanCan::Ability
  
  def initialize(thisuser)
    thisuser ||= User.new
    
    if thisuser.has_role? :manager #manager
      can :manage, :all
    elsif thisuser.has_role? :renter #renter
        can :manage, thisuser
        can :index, [User] 
        #can :manage, [RepairRequest] 
        can :manage, RepairRequest ,  :submitter_id => thisuser.id      
    else #guest
      can :index, [User]
      can :create, [User]
    end
    
  end
end
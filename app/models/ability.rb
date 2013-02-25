class Ability
  include CanCan::Ability
  
  
  
  
  def initialize(thisuser)
    thisuser ||= User.new
    
    alias_action :index, :show, :new, :edit, :create, :update, :destroy, :to => :restful
    
    if thisuser.has_role? :manager #manager
      can [:manage], :all
      can :assign_roles, [User]      
      cannot :open_request, [RepairRequest]
      can :open_request, [RepairRequest], :id => nil                  
      can :close_request, [RepairRequest]
      cannot :close_request, [RepairRequest], :id => nil 
    elsif thisuser.has_role? :renter #renter
        can :manage, thisuser
        can :index, [User] 
        #can :manage, [RepairRequest] 
        can :manage, RepairRequest ,  :submitter_id => thisuser.id 
        cannot :assign_roles, [User]
        can :open_request, [RepairRequest] 
        cannot :close_request , [RepairRequest]    
    else #guest
      can :index, [User]
      can :create, [User]
    end
    
  end
end
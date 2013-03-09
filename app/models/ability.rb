class Ability
  include CanCan::Ability  
  
  def initialize(thisuser)
    thisuser ||= User.new
    
    #
    #
    # Fix this mess
    #
    #
    
    alias_action :index, :show, :new, :edit, :create, :update, :destroy, :to => :restful
    #alias_action :index, :show, :to => :read
    #alias_action :new, :to => :create
    #alias_action :edit, :to => :update
    
    if thisuser.has_role? :manager #manager
      can [:restful, :read], :all 
      can :assign_roles, [User]      
      cannot :open_request, [RepairRequest]
      can :open_request, [RepairRequest], :id => nil                  
      can :close_request, [RepairRequest]
      cannot :close_request, [RepairRequest], :id => nil 
    elsif thisuser.has_role? :renter #renter
        can [:restful, :read],[User], :id => thisuser.id
        #can :index, [User] 
        #can :restful, [RepairRequest] 
        can :restful, RepairRequest ,  :submitter_id => thisuser.id 
        #cannot :assign_roles, [User]
        can :open_request, [RepairRequest] 
        cannot :close_request , [RepairRequest]
        cannot :restful, [Lease, Property, Unit, Payment] 
        can :restful, Payment, :user_id => thisuser.id
        can :destroy, [UserSession]
        cannot :restful, [Lease]
        #can :read, [Lease], :user_ids => thisuser.id    
    else #guest
      can :index, [User]
      can :create, [User]
      can :create, [UserSession]
    end
    
  end
end
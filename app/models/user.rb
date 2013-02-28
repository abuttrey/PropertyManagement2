class User < ActiveRecord::Base
  
 
  
  attr_accessible :email, :password, :username, :crypted_password, :password_confirmation, :role_ids, :lease_ids
  
  before_create :setup_default_role_for_new_users

  def setup_default_role_for_new_users    
      self.roles << Role.where("name='Renter'")
  end
  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }    
  end
  #private

  #auth_logic
  acts_as_authentic
  
  
  
  #associations
  has_and_belongs_to_many :roles
  belongs_to :lease
  has_many :submittedreports, :class_name => 'RepairRequest'
  has_many :approvedreports, :class_name => 'RepairRequest'
  
 
  
end

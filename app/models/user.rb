class User < ActiveRecord::Base
  attr_accessible :email, :password, :username, :crypted_password, :password_confirmation, :role_ids
  
  #auth_logic
  acts_as_authentic
  
  #associations
  has_and_belongs_to_many :roles
  belongs_to :lease
  has_and_belongs_to_many :submittedreports, :class_name => 'RepairRequest'
  has_and_belongs_to_many :approvedreports, :class_name => 'RepairRequest'
end

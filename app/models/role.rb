class Role < ActiveRecord::Base
  attr_accessible :name, :user_ids, :role_ids
  
  has_and_belongs_to_many :users
end

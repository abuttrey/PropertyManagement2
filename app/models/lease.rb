class Lease < ActiveRecord::Base
  attr_accessible :end_date, :rent, :start_date, :unit_id, :renters, :user_ids, :lease_ids
  
  belongs_to :unit
  has_many :users
  
  
 end
  
 
  


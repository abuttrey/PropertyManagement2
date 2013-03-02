class Lease < ActiveRecord::Base
  attr_accessible :end_date, :rent, :start_date, :unit_id, :renters, :user_ids, :lease_ids
  
   validates :rent, :unit_id, :user_ids,  :presence => true
  
  belongs_to :unit
  has_and_belongs_to_many :users
  
  
 end
  
 
  


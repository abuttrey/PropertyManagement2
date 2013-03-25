class Lease < ActiveRecord::Base
  attr_accessible :end_date, :rent, :start_date, :unit_id, :user_ids, :lease_ids, :show_me_the_money
  
  attr_accessor :show_me_the_money
  
  validates :rent, :unit_id, :user_ids,  :presence => true
  
  belongs_to :unit
  has_and_belongs_to_many :users
  has_many :payments
  
  def show_me_the_money
    "Unit: #{self.unit.full_name} - Rent: #{self.rent}"
  end
 end
  
 
  


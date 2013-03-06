class Property < ActiveRecord::Base
  attr_accessible :address, :city, :name, :state, :zip
  
  validates :address, :city, :name, :state, :zip, :presence => true
  
  #associations
  has_many :units
  

end

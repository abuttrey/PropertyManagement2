class Property < ActiveRecord::Base
  attr_accessible :address, :city, :name, :state, :zip
  
  #associations
  has_many :units
end

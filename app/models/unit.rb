class Unit < ActiveRecord::Base
  attr_accessible :name, :sq_ft, :property_id
  
  #associations
  belongs_to :property
  has_many :leases
  
  def full_name
    "#{unit.property.name} - #{unit.name}"
  end
end

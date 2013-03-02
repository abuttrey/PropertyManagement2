class Payment < ActiveRecord::Base
  attr_accessible :amount, :card_expires_on, :first_name, :ip_address, :last_name, :user_id, :lease_id, :card_number, :cvv_code
  
  #add attribute
  attr_accessor  :card_number, :cvv_code
  
  validates :amount, :first_name, :last_name, :card_number, :cvv_code, :presence => true
  
  belongs_to :user
  belongs_to :lease
  has_many :transactions, :class_name => 'PaymentTransaction'
end

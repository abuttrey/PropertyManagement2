class Payment < ActiveRecord::Base
  attr_accessible :amount, :card_expires_on, :first_name, :ip_address, :last_name
  
  belongs_to :user
  belongs_to :lease
  has_many :transactions, :Class_name => 'PaymentTransaction'
end

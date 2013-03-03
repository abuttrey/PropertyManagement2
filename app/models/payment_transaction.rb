class PaymentTransaction < ActiveRecord::Base
  attr_accessible :response, :payment_id
  serialize :response
  
  
  belongs_to :payment
end

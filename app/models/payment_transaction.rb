class PaymentTransaction < ActiveRecord::Base
  attr_accessible :response, :payment_id
end

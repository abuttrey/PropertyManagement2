class Payment < ActiveRecord::Base
  attr_accessible :amount, :card_expires_on, :first_name, :ip_address, :last_name, :user_id, :lease_id, :card_number, :cvv_code
  
  #add attribute
  attr_accessor  :card_number, :cvv_code
  
  validates :amount, :first_name, :last_name, :card_number, :cvv_code, :presence => true
  
  validate :validate_card, :on => :create
  
  belongs_to :user
  belongs_to :lease
  has_many :transactions, :class_name => :PaymentTransaction
  
  def make_transaction
    response = GATEWAY.purchase((amount*100),credit_card)
    transactions.create(:response => response)
    response.success?
  end
  
  private
  
  def credit_card
    # Create a credit card object
    @credit_card = ActiveMerchant::Billing::CreditCard.new({
      :first_name => first_name,
      :last_name  => last_name,
      :number     => card_number,
      :month      => card_expires_on.month,
      :year       => card_expires_on.year,
      :verification_value => cvv_code
      })
  end
  
  def validate_card
    unless credit_card.valid?
        credit_card.errors.full_messages.each do |message|
        errors.add_to_base.message
      end
    end
  end
end

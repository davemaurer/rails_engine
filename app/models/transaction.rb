class Transaction < ActiveRecord::Base
  include SearchAll

  validates_presence_of :invoice_id, :credit_card_number, :result

  belongs_to :invoice
  has_one :merchant, through: :invoice
end

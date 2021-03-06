class InvoiceItem < ActiveRecord::Base
  include SearchAll

  validates_presence_of :invoice_id, :quantity, :unit_price

  belongs_to :item
  belongs_to :invoice
end

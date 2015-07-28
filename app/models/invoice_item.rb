class InvoiceItem < ActiveRecord::Base
  include SearchAll

  belongs_to :item
  belongs_to :invoice
end

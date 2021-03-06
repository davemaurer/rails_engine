class Merchant < ActiveRecord::Base
  include SearchAll

  validates_presence_of :name

  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def total_revenue
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
  end

  def favorite_customer
    Customer.find(invoices.successful.favorite_customer_id)
  end
end

class Invoice < ActiveRecord::Base
  include SearchAll

  validates_presence_of :customer_id, :merchant_id, :status

  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.successful
    joins(:transactions).where(transactions: { result: "success"} )
  end

  def self.best_customer_id
    joins(:customer).group(:customer_id).count.sort_by { |_, count| count }.sort.last[0]
  end

  def self.best_merchant_id
    joins(:merchant).group(:merchant_id).count.sort_by { |_, count| count }.sort.last[0]
  end
end

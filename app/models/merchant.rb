class Merchant < ActiveRecord::Base
  include SearchAll

  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
end

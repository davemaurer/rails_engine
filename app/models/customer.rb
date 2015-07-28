class Customer < ActiveRecord::Base
  include SearchAll

  has_many :invoices
  has_many :merchants, through: :invoices
end

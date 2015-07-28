class Transaction < ActiveRecord::Base
  include SearchAll

  belongs_to :invoice
end

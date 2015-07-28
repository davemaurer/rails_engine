class Item < ActiveRecord::Base
  include SearchAll

  belongs_to :merchant
end

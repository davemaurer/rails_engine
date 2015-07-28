class Item < ActiveRecord::Base
  include SearchAll

  belongs_to :merchant

  def self.find_all_by

  end
end

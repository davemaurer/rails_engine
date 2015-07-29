require 'active_support/concern'

module SearchAll
  extend ActiveSupport::Concern

  included do
    scope :match_one, lambda { |att, val| where("lower(#{att}) = ?", val.downcase).first }

    scope :match_all, lambda { |att, val| where("lower(#{att}) = ?", val.downcase) }
  end
end

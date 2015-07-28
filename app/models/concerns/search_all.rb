# require 'active_support/conern'

module SearchAll
  extend ActiveSupport::Concern
  included do
    scope :search_all, -> { where(search_param) }
  end
end

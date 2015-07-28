require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "merchants have a name" do
    assert_equal "Klein, Rempel and Jones", merchants(:merchant_two).name
    refute_equal "Klein, Rempel", merchants(:merchant_two).name
  end
end

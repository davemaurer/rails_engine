require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "merchant is not valid without a name" do
    merchant = merchants(:merchant_two)
    merchant.name = " "

    refute merchant.valid?

    merchant.name = "abritrary name"

    assert merchant.valid?
  end

  test "merchants have a name" do
    assert_equal "Klein, Rempel and Jones", merchants(:merchant_two).name
    refute_equal "Klein, Rempel", merchants(:merchant_two).name
  end
end

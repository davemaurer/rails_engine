require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "customers have a first_name" do
    assert_equal "Joey", customers(:customer_one).first_name
    refute_equal "Jane", customers(:customer_one).first_name
  end

  test "customers have a last_name" do
    assert_equal "Osinski", customers(:customer_two).last_name
    refute_equal "nottherightthing", customers(:customer_two).last_name
  end

  test "customers have an id" do
    assert_equal 1, customers(:customer_one).id
    refute_equal 3, customers(:customer_one).id
  end
end

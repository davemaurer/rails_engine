require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "customers have a first_name" do
    assert "Joey", customers(:customer_one).first_name
  end

  test "customers have a last_name" do
    assert "Osinski", customers(:customer_two).last_name
  end

  test "customers have an id" do
    assert "1", customers(:customer_one).id
  end
end

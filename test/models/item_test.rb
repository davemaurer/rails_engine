require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "items are not valid without a name" do
    trans = items(:item_one)
    trans.name = nil

    refute trans.valid?

    trans.name = 1

    assert trans.valid?
  end

  test "items are not valid without a description" do
    trans = items(:item_one)
    trans.description = " "

    refute trans.valid?

    trans.description = "gooood"

    assert trans.valid?
  end

  test "items are not valid without a merchant_id" do
    trans = items(:item_one)
    trans.merchant_id = nil

    refute trans.valid?

    trans.merchant_id = 25

    assert trans.valid?
  end

  test "items have a name" do
    assert_equal "Item Qui Esse", items(:item_one).name
    refute_equal "Cumque consequuntur ad.", items(:item_one).name
  end

  test "items have a description" do
    assert_equal "Cumque consequuntur ad.", items(:item_two).description
    refute_equal "Nihil autem sit odio inventore deleniti.", items(:item_two).description
  end

  test "items have a merchant id" do
    assert_equal 15, items(:item_two).merchant_id
    refute_equal 1000, items(:item_two).merchant_id
  end
end

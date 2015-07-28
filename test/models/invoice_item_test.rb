require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  test "invoice items have an item_id" do
    assert_equal 539, invoice_items(:invoice_item_one).item_id
    refute_equal 1000, invoice_items(:invoice_item_one).item_id
  end

  test "invoice items have an invoice id" do
    assert_equal 2, invoice_items(:invoice_item_three).invoice_id
    refute_equal 1000, invoice_items(:invoice_item_three).invoice_id
  end

  test "invoice items have a quantity" do
    assert_equal 9, invoice_items(:invoice_item_two).quantity
    refute_equal 1000, invoice_items(:invoice_item_two).quantity
  end

  test "invoice items have a unit price" do
    assert_equal 34873.0, invoice_items(:invoice_item_three).unit_price.truncate(2).to_i
    refute_equal 1, invoice_items(:invoice_item_three).unit_price.truncate(2).to_i
  end
end

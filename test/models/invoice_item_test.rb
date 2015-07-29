require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  test "invoice_items are not valid without an invoice id" do
    invoice_item = invoice_items(:invoice_item_one)
    invoice_item.invoice_id = nil

    refute invoice_item.valid?

    invoice_item.invoice_id = 1

    assert invoice_item.valid?
  end

  test "invoice_items are not valid without a quantity" do
    invoice_item = invoice_items(:invoice_item_one)
    invoice_item.quantity = " "

    refute invoice_item.valid?

    invoice_item.quantity = 10

    assert invoice_item.valid?
  end

  test "invoice_items are not valid without a unit price" do
    invoice_item = invoice_items(:invoice_item_one)
    invoice_item.unit_price = nil

    refute invoice_item.valid?

    invoice_item.unit_price = 999

    assert invoice_item.valid?
  end

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

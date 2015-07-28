require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  test "invoice items have an item_id" do
    assert 539, invoice_items(:invoice_item_one).item_id
  end

  test "invoice items have an invoice id" do
    assert 2, invoice_items(:invoice_item_three).invoice_id
  end

  test "invoice items have a quantity" do
    assert 9, invoice_items(:invoice_item_two).quantity
  end

  test "invoice items have a unit price" do
    assert 13635, invoice_items(:invoice_item_three).unit_price
  end
end

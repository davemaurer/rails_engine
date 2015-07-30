require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "invoices are not valid without a customer id" do
    invoice = invoices(:invoice_one)
    invoice.customer_id = nil

    refute invoice.valid?

    invoice.customer_id = 1

    assert invoice.valid?
  end

  test "invoices are not valid without a merchant id" do
    invoice = invoices(:invoice_one)
    invoice.merchant_id = " "

    refute invoice.valid?

    invoice.merchant_id = 25

    assert invoice.valid?
  end

  test "invoices are not valid without a status" do
    invoice = invoices(:invoice_one)
    invoice.status = nil

    refute invoice.valid?

    invoice.status = "shipped"

    assert invoice.valid?
  end

  test "invoices have a customer id" do
    assert_equal 1, invoices(:invoice_one).customer_id
    refute_equal 3, invoices(:invoice_one).customer_id
  end

  test "invoices have a merchant id" do
    assert_equal 26, invoices(:invoice_one).merchant_id
    refute_equal 20, invoices(:invoice_one).merchant_id
  end

  test "invoices have a status" do
    assert_equal "shipped", invoices(:invoice_one).status
    refute_equal "not shipped", invoices(:invoice_one).status
  end
end

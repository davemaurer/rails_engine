require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "show returns invoice by id" do
    customer = Customer.create(first_name: "bob", last_name: "barker")
    merchant = Merchant.create(name: "tesla")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    transaction = Transaction.create(invoice_id: invoice.id, credit_card_number: 555555555555555, result: "touchdown!")

    get :show, format: :json, id: transaction.id

    transaction_response = JSON.parse(response.body)

    assert_equal transaction.id, transaction_response["id"]
    assert_equal "touchdown!", transaction_response["result"]
  end


  test "find returns transaction by id" do
    customer = Customer.create(first_name: "bob", last_name: "barker")
    merchant = Merchant.create(name: "tesla")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    transaction = Transaction.create(invoice_id: invoice.id, credit_card_number: 555555555555555, result: "touchdown!")

    get :find, format: :json, id: transaction.id

    invoice_response = JSON.parse(response.body)

    assert_equal transaction.id, invoice_response["id"]
    assert_equal "touchdown!", invoice_response["result"]
  end

  test "find returns transaction by invoice id" do
    customer = Customer.create(first_name: "bob", last_name: "barker")
    merchant = Merchant.create(name: "tesla")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    transaction = Transaction.create(invoice_id: invoice.id, credit_card_number: 555555555555555, result: "touchdown!")

    get :find, format: :json, invoice_id: transaction.invoice_id

    invoice_response = JSON.parse(response.body)

    assert_equal transaction.invoice_id, invoice_response["invoice_id"]
  end

  test "find returns transaction by credit card number" do
    customer = Customer.create(first_name: "bob", last_name: "barker")
    merchant = Merchant.create(name: "tesla")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    transaction = Transaction.create(invoice_id: invoice.id, credit_card_number: 555555555555555, result: "touchdown!")

    get :find, format: :json, credit_card_number: transaction.credit_card_number

    invoice_response = JSON.parse(response.body)

    assert_equal "555555555555555", invoice_response["credit_card_number"]
  end

  test "find returns transaction by result" do
    customer = Customer.create(first_name: "bob", last_name: "barker")
    merchant = Merchant.create(name: "tesla")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    transaction = Transaction.create(invoice_id: invoice.id, credit_card_number: 555555555555555, result: "touchdown!")

    get :find, format: :json, result: transaction.result

    invoice_response = JSON.parse(response.body)

    assert_equal "touchdown!", invoice_response["result"]
  end

  test "find_all returns transactions by result" do
    customer = Customer.create(first_name: "bob", last_name: "barker")
    merchant = Merchant.create(name: "tesla")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    Transaction.create(invoice_id: invoice.id, credit_card_number: 555555555555555, result: "touchdown!")

    get :find_all, format: :json, result: "touchdown!"

    invoices_response = JSON.parse(response.body)

    assert_equal 1, invoices_response.count

    Transaction.create(invoice_id: invoice.id, credit_card_number: 555555555555555, result: "touchdown!")

    get :find_all, format: :json, result: "touchdown!"

    invoices_response = JSON.parse(response.body)

    assert_equal 2, invoices_response.count
  end

  test "find_all returns transactions by credit card number" do
    customer = Customer.create(first_name: "bob", last_name: "barker")
    merchant = Merchant.create(name: "tesla")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    Transaction.create(invoice_id: invoice.id, credit_card_number: 555555555555555, result: "touchdown!")

    get :find_all, format: :json, credit_card_number: 555555555555555

    invoices_response = JSON.parse(response.body)

    assert_equal 1, invoices_response.count

    Transaction.create(invoice_id: invoice.id, credit_card_number: 555555555555555, result: "touchdown!")

    get :find_all, format: :json, credit_card_number: 555555555555555

    invoices_response = JSON.parse(response.body)

    assert_equal 2, invoices_response.count
  end
end

require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "find returns invoice by id" do
    customer = Customer.create(first_name: "bob", last_name: "barker")
    merchant = Merchant.create(name: "tesla")

    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    get :find, format: :json, id: invoice.id

    invoice_response = JSON.parse(response.body)

    assert_equal invoice.id, invoice_response["id"]
    assert_equal "shipped", invoice_response["status"]
  end

  test "find returns invoice by status" do
    customer = Customer.create(first_name: "bob", last_name: "barker")
    merchant = Merchant.create(name: "tesla")

    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    get :find, format: :json, status: invoice.status

    invoice_response = JSON.parse(response.body)

    assert_equal "shipped", invoice_response["status"]
  end

  test "find returns invoice by customer id" do
    customer = Customer.create(first_name: "bob", last_name: "barker")
    merchant = Merchant.create(name: "tesla")

    Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    get :find, format: :json, customer_id: customer.id

    invoice_response = JSON.parse(response.body)

    assert_equal customer.id, invoice_response["customer_id"]
    assert_equal "shipped", invoice_response["status"]
  end

  test "find returns invoice by merchant id" do
    customer = Customer.create(first_name: "bob", last_name: "barker")
    merchant = Merchant.create(name: "tesla")

    Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    get :find, format: :json, merchant_id: merchant.id

    invoice_response = JSON.parse(response.body)

    assert_equal merchant.id, invoice_response["merchant_id"]
    assert_equal "shipped", invoice_response["status"]
  end

  test "find_all returns all invoices by status" do
    customer = Customer.create(first_name: "bob", last_name: "barker")
    merchant = Merchant.create(name: "tesla")

    Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "limbo")

    get :find_all, format: :json, status: "limbo"

    invoices_response = JSON.parse(response.body)

    assert_equal 1, invoices_response.count

    Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "limbo")

    get :find_all, format: :json, status: "limbo"

    invoices_response = JSON.parse(response.body)

    assert_equal 2, invoices_response.count
  end
end

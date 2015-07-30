require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "find returns invoice_item by id" do
    merchant = Merchant.create(name: "tesla")
    customer = Customer.create(first_name: "bob", last_name: "barker")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    item = Item.create(name: "item1", description: "rad", unit_price: 5, merchant_id: merchant.id)

    invoice_item = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, quantity: 3, unit_price: 100)

    get :find, format: :json, id: invoice_item.id

    invoice_item_response = JSON.parse(response.body)

    assert_equal invoice_item.id, invoice_item_response["id"]
    assert_equal "100.0", invoice_item_response["unit_price"]
  end

  test "find returns invoice_item by item id" do
    merchant = Merchant.create(name: "tesla")
    customer = Customer.create(first_name: "bob", last_name: "barker")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    item = Item.create(name: "item1", description: "rad", unit_price: 5, merchant_id: merchant.id)

    invoice_item = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, quantity: 3, unit_price: 100)

    get :find, format: :json, item_id: invoice_item.item_id

    invoice_item_response = JSON.parse(response.body)

    assert_equal invoice_item.item_id, invoice_item_response["item_id"]
    assert_equal "100.0", invoice_item_response["unit_price"]
  end

  test "find returns invoice_item by quantity" do
    merchant = Merchant.create(name: "tesla")
    customer = Customer.create(first_name: "bob", last_name: "barker")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    item = Item.create(name: "item1", description: "rad", unit_price: 5, merchant_id: merchant.id)

    invoice_item = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, quantity: 3, unit_price: 100)

    get :find, format: :json, quantity: invoice_item.quantity

    invoice_item_response = JSON.parse(response.body)

    assert_equal invoice_item.quantity, invoice_item_response["quantity"]
  end

  test "find returns invoice_item by unit_price" do
    merchant = Merchant.create(name: "tesla")
    customer = Customer.create(first_name: "bob", last_name: "barker")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    item = Item.create(name: "item1", description: "rad", unit_price: 5, merchant_id: merchant.id)

    invoice_item = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, quantity: 3, unit_price: 100)

    get :find, format: :json, unit_price: invoice_item.unit_price

    invoice_item_response = JSON.parse(response.body)

    assert_equal "100.0", invoice_item_response["unit_price"]
  end

  test "find returns invoice_item by invoice_id" do
    merchant = Merchant.create(name: "tesla")
    customer = Customer.create(first_name: "bob", last_name: "barker")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    item = Item.create(name: "item1", description: "rad", unit_price: 5, merchant_id: merchant.id)

    invoice_item = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, quantity: 3, unit_price: 100)

    get :find, format: :json, invoice_id: invoice_item.invoice_id

    invoice_item_response = JSON.parse(response.body)

    assert_equal invoice_item.invoice_id, invoice_item_response["invoice_id"]
  end

end

require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "find returns item by id" do
    merchant = Merchant.create(name: "tesla")

    item = Item.create(name: "item1", description: "rad", unit_price: 5, merchant_id: merchant.id)

    get :find, format: :json, id: item.id

    invoice_item_response = JSON.parse(response.body)

    assert_equal item.id, invoice_item_response["id"]
    assert_equal "rad", invoice_item_response["description"]
  end

  test "find returns item by name" do
    merchant = Merchant.create(name: "tesla")

    item = Item.create(name: "item1", description: "rad", unit_price: 5, merchant_id: merchant.id)

    get :find, format: :json, name: item.name

    invoice_item_response = JSON.parse(response.body)

    assert_equal item.name, invoice_item_response["name"]
  end

  test "find returns item by description" do
    merchant = Merchant.create(name: "tesla")

    item = Item.create(name: "item1", description: "rad", unit_price: 5, merchant_id: merchant.id)

    get :find, format: :json, description: item.description

    invoice_item_response = JSON.parse(response.body)

    assert_equal "rad", invoice_item_response["description"]
  end

  test "find returns item by unit_price" do
    merchant = Merchant.create(name: "tesla")

    item = Item.create(name: "item1", description: "rad", unit_price: 5, merchant_id: merchant.id)

    get :find, format: :json, unit_price: item.unit_price

    invoice_item_response = JSON.parse(response.body)

    assert_equal 5, invoice_item_response["unit_price"]
  end

  test "find returns item by merchant id" do
    merchant = Merchant.create(name: "tesla")

    item = Item.create(name: "item1", description: "rad", unit_price: 5, merchant_id: merchant.id)

    get :find, format: :json, merchant_id: item.merchant_id

    invoice_item_response = JSON.parse(response.body)

    assert_equal item.merchant_id, invoice_item_response["merchant_id"]
  end
end

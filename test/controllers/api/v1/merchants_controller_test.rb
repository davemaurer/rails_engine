require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "find returns merchant by id" do
    merchant = Merchant.create(name: "google")

    get :find, format: :json, id: merchant.id.to_s

    merchant_response = JSON.parse(response.body)

    assert_equal merchant.id, merchant_response["id"]
    assert_equal "google", merchant_response["name"]
  end

  test "find returns merchant by name" do
    merchant = Merchant.create(name: "google")

    get :find, format: :json, name: "google"

    merchant_response = JSON.parse(response.body)

    assert_equal merchant.id, merchant_response["id"]
    assert_equal "google", merchant_response["name"]
  end

  test "find returns merchant name regardless of capitalization" do
    merchant = Merchant.create(name: "Google")

    get :find, format: :json, name: "google"

    puts response.body
    merchant_response = JSON.parse(response.body)

    assert_equal merchant.id, merchant_response["id"]
    assert_equal "Google", merchant_response["name"]
  end

  test "find_all returns all merchants by name" do
    Merchant.create(name: "Gargle")

    get :find_all, format: :json, name: "Gargle"

    merchants_response = JSON.parse(response.body)

    assert_equal 1, merchants_response.count

    Merchant.create(name: "Gargle")

    get :find_all, format: :json, name: "Gargle"

    merchants_response = JSON.parse(response.body)

    assert_equal 2, merchants_response.count
  end
end

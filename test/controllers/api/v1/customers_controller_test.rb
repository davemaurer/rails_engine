require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "find returns customer by id" do
    customer = Customer.create(first_name: "john", last_name: "doe")

    get :find, format: :json, id: customer.id

    customer_response = JSON.parse(response.body)

    assert_equal customer.id, customer_response["id"]
    assert_equal "john", customer_response["first_name"]
  end

  test "find returns customer by name" do
    customer = Customer.create(first_name: "john", last_name: "doe")

    get :find, format: :json, first_name: "john"

    customer_response = JSON.parse(response.body)

    assert_equal "john", customer_response["first_name"]
    assert_equal customer.id, customer_response["id"]
  end

  test "find returns customer name regardless of capitalization" do
    customer = Customer.create(first_name: "John", last_name: "Doe")

    get :find, format: :json, first_name: "john"

    customer_response = JSON.parse(response.body)

    assert_equal "John", customer_response["first_name"]
    assert_equal customer.id, customer_response["id"]

    get :find, format: :json, last_name: "doe"

    customer_response = JSON.parse(response.body)

    assert_equal "Doe", customer_response["last_name"]
  end

  test "find_all returns all customers by first name" do
    Customer.create(first_name: "John", last_name: "Doe")

    get :find_all, format: :json, first_name: "John"

    customer_response = JSON.parse(response.body)

    assert_equal 1, customer_response.count

    Customer.create(first_name: "John", last_name: "Donut")

    get :find_all, format: :json, first_name: "John"

    customer_response = JSON.parse(response.body)

    assert_equal 2, customer_response.count
  end

  test "find_all returns all customers by last name" do
    Customer.create(first_name: "John", last_name: "Doe")

    get :find_all, format: :json, last_name: "Doe"

    customer_response = JSON.parse(response.body)

    assert_equal 1, customer_response.count

    Customer.create(first_name: "Jane", last_name: "Doe")

    get :find_all, format: :json, last_name: "Doe"

    customer_response = JSON.parse(response.body)

    assert_equal 2, customer_response.count
  end
end

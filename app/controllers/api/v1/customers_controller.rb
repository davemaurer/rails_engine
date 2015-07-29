class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def random
    respond_with Customer.all.sample
  end

  def find
    respond_with Customer.find_by(search_param)
  end

  def find_all
    respond_with Customer.where(search_param)
  end

  def invoices
    respond_with customer.invoices
  end

  def transactions
    respond_with customer.transactions
  end

  def customer
    Customer.find_by(id: params[:id])
  end
end

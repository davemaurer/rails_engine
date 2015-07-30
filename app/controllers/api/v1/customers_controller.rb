class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with customer
  end

  def random
    respond_with Customer.all.sample
  end

  def invoices
    respond_with customer.invoices
  end

  def transactions
    respond_with customer.transactions
  end

  def find
    if param_value.to_i == 0
      respond_with Customer.match_one(param_key, param_value)
    else
      respond_with Customer.find_by(search_param)
    end
  end

  def find_all
    if param_value.to_i == 0
      respond_with Customer.match_all(param_key, param_value)
    else
      respond_with Customer.where(search_param)
    end
  end

  private

  def customer
    Customer.find_by(id: params[:id])
  end
end

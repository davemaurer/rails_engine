class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with merchant
  end

  def random
    respond_with Merchant.all.sample
  end

  def items
    respond_with merchant.items
  end

  def invoices
    respond_with merchant.invoices
  end

  def revenue
    respond_with Merchant.find_by(id: params[:id]).total_revenue
  end

  def favorite_customer
    respond_with Merchant.find_by(id: params[:id]).favorite.customer
  end

  def find
    if param_value.to_i == 0
      respond_with Merchant.match_one(param_key, param_value)
    else
      respond_with Merchant.find_by(search_param)
    end
  end

  def find_all
    if param_value.to_i == 0
      respond_with Merchant.match_all(param_key ,param_value)
    else
      respond_with Merchant.where(search_param)
    end
  end

  private

  def merchant
    Merchant.find_by(id: params[:id])
  end
end

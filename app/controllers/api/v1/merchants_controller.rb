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

  def find
    if param_value.to_i == 0
      white_listed_params = params.slice(:name)
      respond_with Merchant.match_one(white_listed_params)
    else
      respond_with Merchant.find_by(search_param)
      # if white_listed_params.any?
      #   respond_with Merchant.find_by(white_listed_params).where(lower(white_listed_params))
      # else
      #   render json: {}, status: :not_found
      # end
    end
  end

  def find_all
    if param_value.to_i == 0
      binding.pry
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

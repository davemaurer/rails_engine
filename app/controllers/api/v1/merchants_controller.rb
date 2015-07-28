class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def random
    respond_with Merchant.all.sample
  end

  def search
    respond_with Merchant.find_by(search_param)
  end

  def search_all
    respond_with Merchant.find_by(search_param)
  end
end

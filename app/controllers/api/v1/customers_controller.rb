class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def random
    respond_with Customer.all.sample
  end

  def search
    respond_with Customer.find_by(search_param)
  end

  def search_all
    respond_with Customer.find_by(search_param)
  end
end

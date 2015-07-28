class Api::V1::TransactionsController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def random
    respond_with Transaction.all.sample
  end

  def search
    respond_with Transaction.find_by(search_param)
  end

  def search_all
    respond_with Transaction.find_by(search_param)
  end
end

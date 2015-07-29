class Api::V1::TransactionsController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with transaction
  end

  def random
    respond_with Transaction.all.sample
  end

  def find
    respond_with Transaction.find_by(search_param)
  end

  def find_all
    respond_with Transaction.where(search_param)
  end

  def invoice
    respond_with transaction.invoice
  end

  def transaction
    Transaction.find_by(id: params[:id])
  end
end

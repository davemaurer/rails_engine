class Api::V1::TransactionsController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with transaction
  end

  def random
    respond_with Transaction.all.sample
  end

  def invoice
    respond_with transaction.invoice
  end

  def find
    if param_value.to_i == 0
      respond_with Transaction.match_one(param_key, param_value)
    else
      respond_with Transaction.find_by(search_param)
    end
  end

  def find_all
    if param_value.to_i == 0
      respond_with Transaction.match_all(param_key, param_value)
    else
      respond_with Transaction.where(search_param)
    end
  end

  private

  def transaction
    Transaction.find_by(id: params[:id])
  end
end

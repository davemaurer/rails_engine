class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with item
  end

  def random
    respond_with Item.all.sample
  end

  def invoice_items
    respond_with item.invoice_items
  end

  def merchant
    respond_with item.merchant
  end

  def find
    if param_value.to_i == 0
      respond_with Item.match_one(param_key, param_value)
    else
      respond_with Item.find_by(search_param)
    end
  end

  def find_all
    if param_value.to_i == 0
      respond_with Item.match_all(param_key, param_value)
    else
      respond_with Item.where(search_param)
    end
  end

  private

  def item
    Item.find_by(id: params[:id])
  end
end

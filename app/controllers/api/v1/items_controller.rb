class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with item
  end

  def random
    respond_with Item.all.sample
  end

  def find
    respond_with Item.find_by(search_param)
  end

  def find_all
    respond_with Item.where(search_param)
  end

  def invoice_items
    respond_with item.invoice_items
  end

  def merchant
    respond_with item.merchant
  end

  def item
    Item.find_by(id: params[:id])
  end
end

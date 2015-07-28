class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def random
    respond_with InvoiceItem.all.sample
  end

  def search
    respond_with InvoiceItem.find_by(search_param)
  end

  def search_all
    respond_with InvoiceItem.find_by(search_param)
  end
end

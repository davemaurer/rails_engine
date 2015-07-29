class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with invoice_item
  end

  def random
    respond_with InvoiceItem.all.sample
  end

  def find
    respond_with InvoiceItem.find_by(search_param)
  end

  def find_all
    respond_with InvoiceItem.where(search_param)
  end

  def invoice
    respond_with invoice_item.invoice
  end

  def item
    respond_with invoice_item.item
  end

  def invoice_item
    InvoiceItem.find_by(id: params[:id])
  end
end

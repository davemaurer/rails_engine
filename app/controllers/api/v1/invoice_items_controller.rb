class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.where(invoice_id: params[:invoice_id])
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def create
    respond_with InvoiceItem.create(invoice_item_params)
  end

  def update
    respond_with InvoiceItem.update(params[:id], invoice_item_params)
  end

  def destroy
    respond_with InvoiceItem.destroy(params[:id])
  end

  def random
    respond_with InvoiceItem.all.sample
  end

  private

  def invoice_item_params
    params.require(:invoice_item).permit(:item_id, :invoice_id, :quantity, :unit_price)
  end
end

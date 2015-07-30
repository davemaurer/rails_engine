class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with invoice
  end

  def random
    respond_with Invoice.all.sample
  end

  def transactions
    respond_with invoice.transactions
  end

  def invoice_items
    respond_with invoice.invoice_items
  end

  def items
    respond_with invoice.items
  end

  def customer
    respond_with invoice.customer
  end

  def merchant
    respond_with invoice.merchant
  end

  def find
    respond_with Invoice.find_by(search_param)
  end

  def find_all
    respond_with Invoice.where(search_param)
  end

  private

  def invoice
    Invoice.find_by(id: params[:id])
  end
end

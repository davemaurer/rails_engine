class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def random
    respond_with Invoice.all.sample
  end

  def search
    respond_with Invoice.find_by(search_param)
  end

  def search_all
    respond_with Invoice.find_by(search_param)
  end
end

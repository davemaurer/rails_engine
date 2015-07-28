class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def random
    respond_with Item.all.sample
  end

  def search
    respond_with Item.find_by(search_param)
  end

  def search_all
    respond_with Item.find_all_by(search_param)
  end
end

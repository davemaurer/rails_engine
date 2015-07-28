class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def search_param
    binding.pry
    return params.symbolize_keys.keys.first => params[params.symbolize_keys.keys.first]
  end

  def find_all_by

  end
end

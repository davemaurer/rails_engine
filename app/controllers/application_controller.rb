class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def search_param
    return params.symbolize_keys.keys.first => params[params.symbolize_keys.keys.first]
  end
  # rails solution does the same as the lines above
  def parameters
    request.query_parameters
  end

  def param_key
    params.symbolize_keys.keys.first
  end

  def param_value
    params[param_key]
  end
end

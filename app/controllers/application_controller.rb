class ApplicationController < ActionController::API
  include Response
  include Excepcion
  
  # rescue_from ActiveRecord::RecordNotFound do |exception|
  #   json_response({ message: exception.message }, :not_found)
  # end

  # rescue_from ActiveRecord::RecordInvalid do |exception|
  #   json_response({ message: exception.message }, 422)
  # end

  # rescue_from TypeError do |exception|
  #   json_response( {  message:exception.message }, 500)
  # end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_filter :configure_permitted_parameters, if: :device_controller?
  
  # ## Allow name attribute of device to be saved from UI
  # def configure_permitted_parameters
  #   device_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #   device_parameter_sanitizer.permit(:account_update, keys: [:name])
  # end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhiteList

  before_action :configure_permitted_parameters, if: :devise_controller?

end

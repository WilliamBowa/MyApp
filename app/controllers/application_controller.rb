class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhiteList

  before_action :set_source, :configure_permitted_parameters, if: :devise_controller?

  #in session set variable called source and set it equal to what the string param q is

  def set_source 
    session[:source] = params[:q] if params[:q]
  end
end

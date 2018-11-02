module DeviseWhitelist
  extend ActiveSupport::Concern

  # include do
  #   before_action :configure_permitted_parameters, if: :devise_controller?
  # end

  ## Allow name attribute of devise to be saved from UI
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end

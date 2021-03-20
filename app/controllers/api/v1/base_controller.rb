class Api::V1::BaseController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:user, keys: [:email, :password, :company_name, :location, :brand, :description])
      devise_parameter_sanitizer.permit(:user, keys: [:email, :password, :company_name, :location, :brand, :description])
    end
end

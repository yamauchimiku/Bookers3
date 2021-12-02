class ApplicationController < ActionController::Base
  # deviseのストロングパラメーターを記載
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # sign_upの際に、nameのデータが許可される
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

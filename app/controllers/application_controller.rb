class ApplicationController < ActionController::Base
  # 全てのアクションの前に、ユーザーがログインしているかどうか確認する
  # topとaboutは除く
  before_action :authenticate_user!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  # deviseのストロングパラメーターを記載
  protected
  # ログイン後のパスを指定
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def configure_permitted_parameters
    # sign_upの際に、emailのデータが許可される
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end

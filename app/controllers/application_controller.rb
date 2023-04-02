class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url
  before_action :authenticate_user!, if: :public_url
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def admin_url
    request.fullpath.include?("/admin")
  end

  def public_url
    !admin_url && request.controller_class != Public::HomesController
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana])
  end

 def guest_check
    if current_user.email == 'guest@example.com'
      redirect_to root_path,notice: "このページを見るには会員登録が必要です。"
    end
 end

end

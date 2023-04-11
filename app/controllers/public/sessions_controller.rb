# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(resource)
   user_path(current_user)
  end

  def after_sign_out_path_for(resource)
   root_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def guest_check
    if current_user == User.find(1)
      redirect_to root_path, notice: "このページを見るには会員登録が必要です。"
    end
  end

  protected

  def user_state
     @user = User.find_by(email: params[:user][:email])
     return if !@user
     if @user.valid_password?(params[:user][:password]) && @user.is_deleted
       redirect_to root_path
     end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  end
end

# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def guest_sign_in
    guest_user = User.guest
    sign_in guest_user 
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
    binding.irb
  end

  def admin_guest_sign_in
    admin_user = User.admin_guest
    sign_in admin_user
    redirect_to root_path, notice: 'ゲストadminユーザーとしてログインしました。'
    binding.irb
  end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:remember_me)
  #  end
end

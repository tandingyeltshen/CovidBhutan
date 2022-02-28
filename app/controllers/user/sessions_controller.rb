# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   p "hello world"
  #   # super
  # end

  # POST /resource/sign_in
  def create
    blockeduser = User.where(email:params[:user][:email], is_blocked: 1)
    if blockeduser.exists?
      redirect_to "/users/sign_in", notice: "Invalid Crediential"
    else
      super
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

class RegistrationsController < Devise::RegistrationsController
#TODO: belum dipakai, belum tau caranya overrides RegistrationsController nya ActiveAdmin
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :merchant_id)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password,:merchant_id)
  end
end

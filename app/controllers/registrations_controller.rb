# frozen_string_literal: true

# Registrations controller
class RegistrationsController < Devise::RegistrationsController
  private

  # defines registration parameters
  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  # defines account update parameters
  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
end

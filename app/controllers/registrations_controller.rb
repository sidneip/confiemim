
class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :cpf, :cep, :address, :number)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :cpf, :cep, :address, :number)
  end
end
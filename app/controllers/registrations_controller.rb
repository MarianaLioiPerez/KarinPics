class RegistrationsController < Devise::RegistrationsController
    private
  
    def sign_up_params
      params.require(:kuser).permit(:email, :password, :password_confirmation, :avatar) # Asegúrate de agregar :avatar aquí
    end
  
    def account_update_params
      params.require(:kuser).permit(:email, :password, :password_confirmation, :current_password, :avatar) # Asegúrate de agregar :avatar aquí
    end
  end
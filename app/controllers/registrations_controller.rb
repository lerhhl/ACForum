class RegistrationsController < Devise::RegistrationsController

before_action :configure_permitted_parameters, if: :devise_controller?


 private

  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password)
  end

    

  protected


    def configure_permitted_parameters
      #evise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      #devise_parameter_sanitizer.permit(:account_update, keys: [:email, :firstname, :lastname, :file_location])
      
      devise_parameter_sanitizer.permit(:account_update) do |user_params|
        user_params.permit(:email, :firstname, :lastname, :avatar, :avatar_cache, :remove_avatar)
      end
    end
end
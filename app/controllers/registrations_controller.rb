class RegistrationsController < Devise::RegistrationsController
    private
    
      def sign_up_params
        params.require(:user).permit(
          :email,
          :password,
          :password_confirmation,
          :cell_phone,
          :work_phone,
          :home_phone,
          address: [:street_address, :city, :state, :zip])
      end
    
      def account_update_params
        params.require(:user).permit(
          email,
          :password,
          :password_confirmation,
          :current_password,
          :cell_phone,
          :work_phone,
          :home_phone,
          address: [:street_address, :city, :state, :zip])
      end
      
    end
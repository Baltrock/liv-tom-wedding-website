class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  protected


  # def create
  # end
  # def after_sign_in_path(resource)
  #   # if resource.is_admin
  #   #   :admins_path
  #   elsif resource.is_admin == false
  #     :users_path
  #   else
  #     super
  #   end
  # end
end

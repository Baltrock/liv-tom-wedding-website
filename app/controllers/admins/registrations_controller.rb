class Admins::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]
  before_action :configure_account_update_params, only: [:update]


  protected

  def create
  end

  def after_sign_in_path_for(resource)
    if resource.admin
      :admins
    elsif resource.admin == false
      :users
    else
      super
    end
  end

  def action_controller
  end

end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :authenticate_admin!, only: [:action]

  def home
    wedding = Date.parse("2023-05-27")
    today = Date.today
    @difference = (wedding - today).to_i
  end

  def primary
    @wedding = Date.parse("2023-05-17")
    @today = Date.today
    @difference = (wedding - today).to_i
  end

  def your_order #before_filter
    if user.password.present?
     authenticate using valid_password? method of devise
   else
     redirect_to primary_url(@primary_path)
   end
  end

  def set_password
  end

end

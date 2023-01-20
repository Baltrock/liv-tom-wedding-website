class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

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

end

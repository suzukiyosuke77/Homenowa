class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:top, :about]
  #helper_method :user_signed_in?, :current_user

  def about
  end
  
  def top
  end
  
end

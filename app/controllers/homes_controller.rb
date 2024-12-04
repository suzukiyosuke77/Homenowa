class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:top]
  #helper_method :user_signed_in?, :current_user
  
  def top
  end
  
end

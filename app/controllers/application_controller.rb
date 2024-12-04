class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :admin_controller?
  
  def after_sign_in_path_for(resource)
    posts_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_users_path 
    else
      posts_path
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path # 管理者の場合
    else
      root_path # 一般ユーザーの場合
    end
  end
  
  private

  def admin_controller?
    self.class.name.start_with?('Admin::')
  end
end
class Admin::SessionsController < Devise::SessionsController
  protected

  # ログイン成功後のリダイレクト先を指定
  def after_sign_in_path_for(resource)
    admin_users_path # 管理者用のユーザー一覧ページなど
  end
  
    # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path # 管理者ログインページ
  end
end

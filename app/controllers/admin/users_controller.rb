class Admin::UsersController < ApplicationController
  before_action :authenticate_admin! # 管理者のみアクセス可能

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update(deleted_at: Time.current)
      redirect_to admin_users_path, notice: '会員を退会させました。'
    else
      redirect_to admin_users_path, alert: '退会処理に失敗しました。'
    end
  end
end

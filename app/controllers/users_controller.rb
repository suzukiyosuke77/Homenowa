class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to root_path, alert: "無効な会員です…"
    else
      @posts = @user.posts
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to user_path(current_user), alert: "会員情報が見つかりません…"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice ] = "会員情報の更新に成功しました！"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def index
    #@user = User.find(params[:id])
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "会員情報を削除しました。"
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

  def is_matching_login_user
    if current_user.nil?
      redirect_to root_path, alert: "ログインが必要です。"
      return
    end

    user = User.find_by(id: params[:id])
    if user.nil?
      redirect_to user_path(current_user), alert: "会員が見つかりません。"
    elsif user.id != current_user.id
      redirect_to edit_user_path(current_user), alert: "アクセス権限がありません。"
    end
  end

end
class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.pending
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to admin_posts_path, notice: '投稿を削除しました。'
    else
      redirect_to admin_posts_path, alert: '投稿の削除に失敗しました。'
    end
  end

  def approve
    @post = Post.find(params[:id])
    if params[:status] == "approved"
      @post.approved!
      redirect_to admin_posts_path, notice: "投稿を許可しました。"
    elsif params[:status] == "rejected"
      @post.rejected!
      redirect_to admin_posts_path, alert: "投稿を却下しました。"
    else
      redirect_to admin_posts_path, alert: "無効な操作です。"
    end
  end
end
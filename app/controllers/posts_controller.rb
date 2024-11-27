class PostsController < ApplicationController
  before_action :is_matching_login_post_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿が完了しました！"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @users = User.all
    @user = current_user
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "更新できました！"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to "/posts"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category)
  end

  def is_matching_login_post_user
    post = Post.find_by(id: params[:id])
    unless post && post.user == current_user
      redirect_to posts_path, alert: "権限がありません"
    end
  end

end
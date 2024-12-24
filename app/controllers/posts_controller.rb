class PostsController < ApplicationController
  # ログインしていないユーザーを制限
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # ログインユーザー以外の投稿編集・削除を制限
  before_action :is_matching_login_post_user, only: [:edit, :update, :destroy]

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
    @posts = Post.approved.page(params[:page]).per(10).most_liked_in_last_week
    @user = current_user if user_signed_in?
  end

  def show
    @post = Post.find_by(id: params[:id], status: "approved")
    if @post.nil?
      redirect_to posts_path
    else
      @user = @post.user
      @post_comment = PostComment.new
    end
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

  def ranking
    @posts = Post.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC').limit(10)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy
      redirect_to posts_path, notice: "投稿を削除しました"
    else
      redirect_to posts_path, alert: "権限がありません"
    end
  end

  def search
    redirect_to search_searches_path(search_params)
  end
  
  def category
    @category = params[:category]
    if @category.present?
      @posts = Post.tagged_with(@category, on: :categories)
    else
      redirect_to posts_path, alert: "カテゴリを入力してください"
    end
  end

  private

  def is_matching_login_post_user
    @post = Post.find_by(id: params[:id])
    if @post.nil? || @post.user != current_user
      redirect_to posts_path, alert: "権限がありません"
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :rating, :category_list)
  end

  def search_params
    params.permit(:keyword, :category)
  end
  
end
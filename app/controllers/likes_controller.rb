class LikesController < ApplicationController
  before_action :set_post

  def create
    like = @post.likes.new(user: current_user)
    if like.save
      redirect_to request.referer, notice: 'いいねをありがとうございます'
    else
      redirect_to request.referer, alert: 'いいねができませんでした...'
    end
  end

  def destroy
    like = current_user.likes.find_by(post: @post)
    if like.destroy
      redirect_to post_path(@post), notice: "いいねを削除しました"
    else
      redirect_to post_path(@post), alert: "いいねの削除に失敗しました"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end

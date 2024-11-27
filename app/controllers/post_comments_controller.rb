class PostCommentsController < ApplicationController
  
def create
  puts params.inspect
  @post = Post.find(params[:post_id])
  @post_comment = current_user.post_comments.new(post_comment_params)
  @post_comment.post_id = @post.id
  if @post_comment.save
    redirect_to @post, notice: 'コメントを投稿しました！'
  else
    redirect_to @post, alert: 'コメントの投稿に失敗しました。'
  end
end

def destroy
  PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
  redirect_to request_refer
end

private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end

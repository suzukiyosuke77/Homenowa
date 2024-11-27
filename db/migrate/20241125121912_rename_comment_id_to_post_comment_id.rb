class RenameCommentIdToPostCommentId < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :comment_id, :post_comment_id
    #rename_column :users, :comment_id, :post_comment_id
  end
end
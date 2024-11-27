class AddPostIdToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :post_id, :integer
    add_index :post_comments, :post_id
  end
end

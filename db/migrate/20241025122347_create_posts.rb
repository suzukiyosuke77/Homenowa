class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :tag_id
      t.integer :comment_id
      t.integer :user_name
      t.string :title
      t.text :body
      t.string :category
      t.integer :admin_check
      t.timestamps
    end
  end
end

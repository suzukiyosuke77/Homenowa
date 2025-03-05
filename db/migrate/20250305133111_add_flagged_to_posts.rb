class AddFlaggedToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :flagged, :boolean
  end
end

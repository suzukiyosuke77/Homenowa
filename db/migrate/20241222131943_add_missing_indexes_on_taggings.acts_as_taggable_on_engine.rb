class AddMissingUniqueIndices < ActiveRecord::Migration[6.1]
  def up
    # 外部キー制約を削除
    remove_foreign_key :taggings, column: :tag_id if foreign_key_exists?(:taggings, column: :tag_id)

    # インデックスを削除
    remove_index :taggings, :tag_id if index_exists?(:taggings, :tag_id)

    # 必要であれば、新しいインデックスを追加
    add_index :tags, :name, unique: true unless index_exists?(:tags, :name)
  end

  def down
    # 元に戻す処理（必要に応じて記述）
  end
end

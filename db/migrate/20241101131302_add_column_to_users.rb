class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin_check, :integer
  end
end
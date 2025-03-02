class ChangeUserIdToBigIntInReports < ActiveRecord::Migration[6.1]
  def change
    change_column :reports, :user_id, :bigint
  end
end

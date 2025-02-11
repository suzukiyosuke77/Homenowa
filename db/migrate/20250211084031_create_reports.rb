class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :user, null: false, foreign_key: true
      t.text :reason
      t.string :status

      t.timestamps
    end
  end
end

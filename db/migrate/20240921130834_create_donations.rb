class CreateDonations < ActiveRecord::Migration[7.1]
  def change
    create_table :donations do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end

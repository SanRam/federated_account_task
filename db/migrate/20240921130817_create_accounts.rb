class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.references :parent, null: true, foreign_key: { to_table: :accounts }

      t.timestamps
    end
  end
end

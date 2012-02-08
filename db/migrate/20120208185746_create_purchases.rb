class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :description
      t.decimal :amount
      t.belongs_to :user

      t.timestamps
    end
    add_index :purchases, :user_id
  end
end

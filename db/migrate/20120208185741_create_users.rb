class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.belongs_to :household

      t.timestamps
    end
    add_index :users, :household_id
  end
end

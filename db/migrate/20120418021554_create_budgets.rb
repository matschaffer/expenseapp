class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.belongs_to :user
      t.string :tag
      t.decimal :amount
      t.decimal :current_total

      t.timestamps
    end
    add_index :budgets, :user_id
  end
end

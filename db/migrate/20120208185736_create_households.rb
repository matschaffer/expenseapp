class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :address

      t.timestamps
    end
  end
end

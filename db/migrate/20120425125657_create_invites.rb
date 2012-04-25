class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :token
      t.string :sent_to
      t.belongs_to :household

      t.timestamps
    end
  end
end

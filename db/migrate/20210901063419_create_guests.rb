class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string  :guest_name, null: false
      t.integer :gender, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

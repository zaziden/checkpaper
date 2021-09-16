class CreateCheckrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :checkrooms do |t|
      t.string  :room_name, null: false
      t.integer :how_many, null: false
      t.string  :staff_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

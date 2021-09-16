class CreateChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :checks do |t|
      t.string  :menuname,     null: false
      t.integer :menuprice,    null: false
      t.integer :cup,          null: false
      t.integer :menuallprice, null: false
      t.references :checkroom, null: false, foreign_key: true
      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end

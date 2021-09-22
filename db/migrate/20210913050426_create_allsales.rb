class CreateAllsales < ActiveRecord::Migration[6.0]
  def change
    create_table :allsales do |t|
      t.integer :allprice, nill:false
      t.string :checkstaff, nill:false
      t.references :checkroom, null: false, foreign_key: true
      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end

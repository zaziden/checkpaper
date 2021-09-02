class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string  :nickname, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

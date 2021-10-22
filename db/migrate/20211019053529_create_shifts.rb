class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.string :shift_staff,  nill: false
      t.datetime :start_time
      t.datetime :stop_time
      t.references :user,      null: false, foreign_key: true
      t.timestamps
      
    end
  end
end

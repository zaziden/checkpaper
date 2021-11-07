class RemoveGenderFromGuests < ActiveRecord::Migration[6.0]
  def change
    remove_column :guests, :gender, :integer
  end
end

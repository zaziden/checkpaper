class AddDeletedAtToAllsales < ActiveRecord::Migration[6.0]
  def change
    add_column :allsales, :deleted_at, :datetime
    add_index :allsales, :deleted_at
  end
end

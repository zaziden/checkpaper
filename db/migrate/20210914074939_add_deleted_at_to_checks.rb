class AddDeletedAtToChecks < ActiveRecord::Migration[6.0]
  def change
    add_column :checks, :deleted_at, :datetime
    add_index :checks, :deleted_at
  end
end

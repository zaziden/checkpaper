class AddDeletedAtToCheckrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :checkrooms, :deleted_at, :datetime
    add_index :checkrooms, :deleted_at
  end
end

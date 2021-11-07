class AddDetailsToAllsales < ActiveRecord::Migration[6.0]
  def change
    add_column :allsales, :howmany, :integer
  end
end

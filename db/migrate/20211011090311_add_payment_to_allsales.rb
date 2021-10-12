class AddPaymentToAllsales < ActiveRecord::Migration[6.0]
  def change
    add_column :allsales, :payment, :string
  end
end

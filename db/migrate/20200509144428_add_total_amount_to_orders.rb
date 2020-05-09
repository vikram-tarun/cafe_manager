class AddTotalAmountToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :total_amount, :bigint
  end
end

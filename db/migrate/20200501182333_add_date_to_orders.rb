class AddDateToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :date, :timestamp
    add_column :orders, :delivered_at, :timestamp
  end
end

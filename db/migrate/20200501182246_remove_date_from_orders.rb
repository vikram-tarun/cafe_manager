class RemoveDateFromOrders < ActiveRecord::Migration[6.0]
  def change

    remove_column :orders, :date, :daterange

    remove_column :orders, :delivered_at, :daterange
  end
end

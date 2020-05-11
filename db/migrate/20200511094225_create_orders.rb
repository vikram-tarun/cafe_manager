class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.datetime :date
      t.datetime :delivered_at
      t.bigint :total_amount
    end
  end
end

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.daterange :date
      t.bigint :user_id
      t.daterange :delivered_at
    end
  end
end

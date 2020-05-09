class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  def self.place_order(cart, user_id)
    @order = create!(user_id: user_id, date: DateTime.current)
    @total_amount = 0
    cart.keys.each do |id|
      cart_item = cart[id][0]
      item_id = cart_item["id"]
      item_name = cart_item["name"]
      item_quantity = cart[id][1]
      item_price = cart_item["price"]
      @total_amount += (item_quantity * item_price)
      @order.order_items.create!(menu_item_id: item_id, menu_item_name: item_name, menu_item_price: item_price, quantity: item_quantity)
    end
    @order.update(total_amount: @total_amount)
    return @order
  end
end

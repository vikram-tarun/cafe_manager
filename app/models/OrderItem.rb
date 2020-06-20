class OrderItem < ApplicationRecord
  validates :quantity, numericality: { greater_than: 0 }
  belongs_to :order
  belongs_to :menu_item
end

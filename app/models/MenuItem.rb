class MenuItem < ApplicationRecord
  validates :name, length: { minimum: 2 }
  validates :description, length: { minimum: 2 }
  validates :price, numericality: { greater_than: 0 }
  belongs_to :menu

  def self.updateitem(h)
    @menu_item = find(h[h.keys[0]])
    if h[h.keys[1]] != ""
      @menu_item.update(name: h[h.keys[1]])
    elsif h[h.keys[2]] != ""
      @menu_item.update(price: h[h.keys[2]])
    elsif h[h.keys[3]] != ""
      @menu_item.update(description: h[h.keys[3]])
    end
    @menu_item.save
  end
end

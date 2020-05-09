class MenuItem < ApplicationRecord
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
    @menu_item.save!
  end
end

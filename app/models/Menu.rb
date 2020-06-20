class Menu < ApplicationRecord
  validates :name, length: { minimum: 2 }
  has_many :menu_items

  def self.set_active_menu(menu_id)
    update_all(active_menu: 0)
    @active_menu = find(menu_id)
    @active_menu.update(active_menu: 1)
    return @active_menu
  end

  def self.delete_menu(menu_id)
    @menu = Menu.find(menu_id)
    @menu.menu_items.delete_all
    @menu.delete
  end
end

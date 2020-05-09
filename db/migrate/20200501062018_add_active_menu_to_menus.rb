class AddActiveMenuToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :active_menu, :bigint
  end
end

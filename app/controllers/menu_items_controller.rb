class MenuItemsController < ApplicationController
  def destroy
    menu_item_id = params[:id]
    menu_id = MenuItem.find(menu_item_id).menu_id
    MenuItem.delete(menu_item_id)
    redirect_to "/menu/#{menu_id}"
  end
end

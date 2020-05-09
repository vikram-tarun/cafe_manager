class MenuItemsController < ApplicationController
  skip_before_action :ensure_owner_logged_in

  def show
    @user_role = current_user.role
    @menu_item = MenuItem.find(params[:id])
    @cart = MenuItem.find(session[:cart].keys)
  end

  def create
    ensure_owner_logged_in and return
    menu_id = params[:menu_id]
    name = params[:name]
    price = params[:price]
    description = params[:description]
    MenuItem.create!(menu_id: menu_id, name: name, price: price, description: description)
    redirect_to menu_path(menu_id)
  end

  def update
    ensure_owner_logged_in and return
    h = { "id" => params[:id], "name" => params[:name], "price" => params[:price], "description" => params[:description] }
    MenuItem.updateitem(h)
    redirect_to menu_item_path
  end

  def destroy
    ensure_owner_logged_in and return
    menu_item_id = params[:id]
    menu_id = MenuItem.find(menu_item_id).menu_id
    MenuItem.delete(menu_item_id)
    redirect_to "/menu/#{menu_id}"
  end
end

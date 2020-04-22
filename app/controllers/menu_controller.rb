class MenuController < ApplicationController
  def create
    menu_name = params[:name]
    Menu.create!(name: menu_name)
    redirect_to cafe_index_path
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def update
    menu_id = params[:id]
    name = params[:name]
    price = params[:price]
    description = params[:description]
    MenuItem.create!(menu_id: menu_id, name: name, price: price, description: description)
    redirect_to menu_path
  end
end

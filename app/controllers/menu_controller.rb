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
    menu = Menu.find(menu_id)
    menu.update(name: name)
    menu.save!
    redirect_to menu_path
  end

  def destroy
    Menu.delete_menu(params[:id])
    redirect_to cafe_index_path
  end
end

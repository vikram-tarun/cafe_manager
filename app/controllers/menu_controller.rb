class MenuController < ApplicationController
  def create
    menu_name = params[:name]
    new_menu = Menu.new(name: menu_name)
    if new_menu.save
      redirect_to menu_path(new_menu.id)
    else
      flash[:error] = new_menu.errors.full_messages.join(", ")
      redirect_to cafe_index_path
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def update
    menu_id = params[:id]
    name = params[:name]
    menu = Menu.find(menu_id)
    menu.update(name: name)
    if menu.save
      redirect_to menu_path(menu.id)
    else
      flash[:notice] = menu.errors.full_messages.join(", ")
      redirect_to menu_path(menu.id)
    end
  end

  def destroy
    Menu.delete_menu(params[:id])
    redirect_to cafe_index_path
  end
end

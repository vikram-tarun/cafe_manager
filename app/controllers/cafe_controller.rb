class CafeController < ApplicationController
  skip_before_action :ensure_owner_logged_in

  def index
    @user_role = current_user.role
    @active_menu = Menu.find_by(active_menu: 1)
    @menu = Menu.all
    @cart = session[:cart]
  end

  def create
    ensure_owner_logged_in and return
    @active_menu = Menu.set_active_menu(params[:active_menu])
    redirect_to cafe_index_path
  end
end

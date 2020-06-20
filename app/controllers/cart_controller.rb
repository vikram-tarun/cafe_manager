class CartController < ApplicationController
  skip_before_action :ensure_owner_logged_in

  def add
    item_id = params[:id].to_i
    quantity = params[:quantity].to_i
    unless quantity == 0
      session[:cart].store(item_id, [MenuItem.find(item_id), quantity])
      redirect_to cafe_index_path
    else
      flash[:notice] = "Quantity should be mentioned."
      redirect_to menu_item_path(item_id)
    end
  end

  def remove
    item_id = params[:id].to_i
    session[:cart].delete_if { |key, value| key >= "#{item_id}" }
    redirect_back(fallback_location: cafe_index_path)
  end
end

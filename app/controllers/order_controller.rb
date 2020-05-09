class OrderController < ApplicationController
  skip_before_action :ensure_owner_logged_in

  def index
    @pending_orders = Order.where(delivered_at: nil).order("id")
  end

  def create
    @cart = session[:cart]
    if @current_user.role == "user"
      @order = Order.place_order(@cart, @current_user.id)
    else
      @order = Order.place_order(@cart, User.find_by(name: "Walk-In Customer").id)
    end
    session[:cart] = Hash.new
    redirect_to order_path(@order.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    id = params[:id]
    Order.find(id).update(delivered_at: DateTime.current)
    redirect_to order_index_path
  end
end

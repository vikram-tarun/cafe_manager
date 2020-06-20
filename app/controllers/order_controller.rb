class OrderController < ApplicationController
  skip_before_action :ensure_owner_logged_in

  def index
    @cart = session[:cart]
    if @current_user.role == "customer"
      @orders = Order.where("user_id = ?", @current_user.id).order("id DESC")
    elsif @current_user.role == "owner" || @current_user.role == "billing clerk"
      @pending_orders = Order.where(delivered_at: nil).order("id")
    end
  end

  def create
    @cart = session[:cart]
    unless @cart.empty?
      if @current_user.role == "customer"
        @order = Order.place_order(@cart, @current_user.id)
      elsif @current_user.role == "owner" || @current_user.role == "billing clerk"
        @order = Order.place_order(@cart, User.find_by(name: "Walk-In Customer").id)
      end
      session[:cart] = Hash.new
      redirect_to order_path(@order.id)
    else
      flash[:notice] = "Cart is Empty..!!"
      redirect_to cafe_index_path
    end
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

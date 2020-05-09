class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  skip_before_action :ensure_owner_logged_in

  def new
  end

  def create
    name = params[:name]
    password = params[:password]
    user = User.create!(name: name, password: password, role: "user")
    session[:current_user_id] = user.id
    session[:cart] = Hash.new
    redirect_to "/"
  end

  def show
    ensure_user_logged_in
    @orders = Order.where("user_id = ?", @current_user.id).order("id DESC")
  end
end

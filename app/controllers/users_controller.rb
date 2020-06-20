class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  skip_before_action :ensure_owner_logged_in

  def index
    ensure_owner_logged_in
    @billing_clerks = User.where(role: "billing clerk")
    @customers = User.where(role: "customer")
  end

  def new
  end

  def create
    name = params[:name]
    password = params[:password]
    role = params[:role]
    user = User.new(name: name, password: password, role: role)
    if user.save
      if role == "customer"
        session[:current_user_id] = user.id
        session[:cart] = Hash.new
        redirect_to "/"
      elsif role == "billing clerk"
        redirect_back(fallback_location: users_path)
      end
    else
      flash[:error] = user.errors.full_messages.join(", ")
      if role == "billing clerk"
        redirect_back(fallback_location: users_path)
      else
        redirect_to new_user_path
      end
    end
  end

  def show
    ensure_owner_logged_in
    @user = User.find(params[:id])
  end

  def destroy
    ensure_owner_logged_in
    User.delete(params[:id])
    redirect_to users_path
  end

  def update
    User.clerk_update(params[:id], params[:name], params[:password])
    redirect_back(fallback_location: user_path(params[:id]))
  end
end

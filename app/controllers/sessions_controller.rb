class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  skip_before_action :ensure_owner_logged_in

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      session[:cart] = Hash.new
      redirect_to "/"
    else
      render plain: "Credentials Incorrect!"
    end
  end

  def delete
    session[:current_user_id] = nil
    @current_user = nil
    session[:cart] = nil
    redirect_to "/"
  end
end

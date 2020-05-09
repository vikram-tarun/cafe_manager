class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in
  skip_before_action :ensure_owner_logged_in

  def index
    if current_user
      redirect_to cafe_index_path
    else
      render "index"
    end
  end
end

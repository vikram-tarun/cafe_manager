class InvoicesController < ApplicationController
  def list
    start_date = params[:start_date]
    end_date = params[:end_date]
    if start_date == "" || end_date == ""
      flash[:error] = "Please enter valid date in both fields."
      redirect_back(fallback_location: invoices_list_path)
    else
      unless start_date == nil || end_date == nil
        @list = Order.where("date BETWEEN ? AND ?", start_date, end_date).order("id")
      else
        @list = nil
      end
    end
  end

  def users_list
    start_date = params[:start_date]
    end_date = params[:end_date]
    user_id = params[:id]
    @user_name = User.find(user_id).name
    if start_date == "" || end_date == ""
      flash[:error] = "Please enter valid date in both fields."
      redirect_back(fallback_location: invoices_users_path)
    else
      unless start_date == nil || end_date == nil
        @list = Order.where("date BETWEEN ? AND ? AND user_id = ?", start_date, end_date, user_id).order("id")
      else
        @list = nil
      end
    end
  end
end

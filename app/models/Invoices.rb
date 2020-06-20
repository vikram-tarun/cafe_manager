class Invoices
  attr_reader :start_date, :end_date

  def initialize(params)
    params ||= {}
    @start_date = params[:start_date] == nil ? 7.days.ago.to_date : params[:start_date]
    @end_date = params[:end_date] == nil ? Date.today : params[:end_date]
  end

  def range
    Order.where("date BETWEEN ? AND ?", @start_date, @end_date)
  end
end

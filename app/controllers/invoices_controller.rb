class InvoicesController < ApplicationController
  def index
    @invoices = Invoices.new(params[:search])
    @list = @invoices.range
  end

  def show
  end
end

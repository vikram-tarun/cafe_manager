class CafeController < ApplicationController
  def index
    @menu = Menu.all
  end
end

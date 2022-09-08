class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index


  def index
    @order = Order.new
  end

  def create
  end

  

  

end

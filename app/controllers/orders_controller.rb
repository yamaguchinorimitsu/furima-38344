class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index


  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end



  private
  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :address, :building, :tell_number) .merge(user_id: current_user.id)
  end

  


end

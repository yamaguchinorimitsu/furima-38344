class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end

def item_params
  params.require(:item).permit(:image, :content, :item_name, :price, :condition_id, :category_id, :prefecture_id,
                               :delivery_charge_id, :delivery_time_id).merge(user_id: current_user.id)
end

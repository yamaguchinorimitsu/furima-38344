class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :set_user, only: [:edit, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def edit
  end

  def new
    @item = Item.new
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :content, :item_name, :price, :condition_id, :category_id, :prefecture_id,
                                 :delivery_charge_id, :delivery_time_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    redirect_to root_path unless current_user.id == @item.user_id
  end
end

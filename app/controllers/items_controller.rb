class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_paramas)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_paramas)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_paramas
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    return if current_user.id == @item.user.id

    redirect_to root_path
  end
end

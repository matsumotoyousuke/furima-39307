class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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
    @item = Item.find(params[:id])
    if user_signed_in?
      if current_user.id == @item.user.id
        @item = Item.find(params[:id])
      else
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
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
end

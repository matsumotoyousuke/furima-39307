class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :individual_info, only: [:show, :edit, :update, :destroy]
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
  end

  def edit
  end

  def update
    if @item.update(item_paramas)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_paramas
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    return if current_user.id == @item.user.id

    redirect_to root_path
  end

  def individual_info
    @item = Item.find(params[:id])
  end
end

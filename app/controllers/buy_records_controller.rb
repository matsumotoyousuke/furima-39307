class BuyRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :individual_data, only: [:index, :create]

  def index
    @buy_record_address = BuyRecordAddress.new
    return unless user_signed_in?
    return unless current_user.id == @item.user.id

    redirect_to root_path
  end

  def create
    @buy_record_address = BuyRecordAddress.new(buy_record_address_params)
    if @buy_record_address.valid?
      pay_item
      @buy_record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_record_address_params
    params.require(:buy_record_address).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_record_address_params[:token],
      currency: 'jpy'
    )
  end

  def individual_data
    @item = Item.find(params[:item_id])
  end
end

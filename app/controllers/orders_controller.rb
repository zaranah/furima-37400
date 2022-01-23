class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index_after_soldout, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index_after_soldout
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.order == nil
  end
end

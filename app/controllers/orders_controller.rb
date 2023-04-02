class OrdersController < ApplicationController
  before_action :move_to_signed_in, except: [:new, :create]

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def new
    @item = Item.new
  end

  def create
    @buyer = BuyerForm.new(set_params)
    if @buyer.valid?
      @buyer.save
      redirect_to root_path
    else
      redirect_to item_orders_url

    end
  end





  private

  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end

  def set_params
    params.permit(:item, :user, :post_code, :shipping_area_id, :municipalities, :address, :building, :telephone_number)
  end
end
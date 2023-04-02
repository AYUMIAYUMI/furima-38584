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
end
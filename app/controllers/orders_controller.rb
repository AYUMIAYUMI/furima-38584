class OrdersController < ApplicationController

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


end
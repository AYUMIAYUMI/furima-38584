class OrdersController < ApplicationController

  def index
    @item = Item.find_by(params[:item_id])
  end

  def new
    @item = Item.new
  end

  def create
  end

end


private

def order_params
  params.require(:order).merge(user_id: current_user.id, item_id: params[:item_id])
end
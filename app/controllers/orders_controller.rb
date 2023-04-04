class OrdersController < ApplicationController
  before_action :move_to_signed_in, except: [:create]

  def index
    @item = Item.find(params[:item_id])
    @buyer_form = BuyerForm.new(buyer_params)#エラー解消追加１
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end


  def create
    @buyer_form = BuyerForm.new(buyer_params)
    if @buyer_form.valid?
      @buyer_form.save
      redirect_to root_path
    else
      render :index
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

  def buyer_params
    params.permit(:post_code, :shipping_area_id, :municipalities, :address, :telephone_number, :buyer_id).merge(user_id: current_user.id, item_id: @item.id)#itemとbuyer_idは曖昧
  end
end
class OrdersController < ApplicationController
  before_action :move_to_signed_in, except: [:create]



  def index
    @item = Item.find(params[:item_id])
    @buyer_form = BuyerForm.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end


  def create
    @item = Item.find(params[:item_id])
    @buyer_form = BuyerForm.new(buyer_params)
    if @buyer_form.valid?
      @buyer_form.save
      redirect_to root_path
    else
      render :index
    end
  end





  private

  

  def move_to_signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end

  

  def buyer_params
    params.require(:buyer_form).permit(:post_code, :shipping_area_id, :municipalities, :address, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
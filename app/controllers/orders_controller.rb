class OrdersController < ApplicationController
  before_action :move_to_signed_in, except: [:create]



  def index
    @item = Item.find(params[:item_id])
    @buyer_form = BuyerForm.new
    if current_user.id == @item.user_id || @item.buyer.present?
      redirect_to root_path
    end
  end


  def create
    @item = Item.find(params[:item_id])
    @buyer_form = BuyerForm.new(buyer_params)
    if @buyer_form.valid?
      pay_item
      @buyer_form.save
      redirect_to root_path
    else
      render :index
    end
  end

    def pay_item
      Payjp.api_key =  ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,
        card: buyer_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end



  private

  

  def move_to_signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end

  

  def buyer_params
    params.require(:buyer_form).permit(:post_code, :shipping_area_id, :municipalities, :building, :address, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
end
class BuyersController < ApplicationController
  
  def index
    @buyer = buyerForm.new(set_params)
    if @buyer.valid?
      @buyer.save
    end
  end

    def create
      Buyer.create(buyer_params)
      @buyer = Buyer.create(buyer_params)
      ShippingAddress.create(shipping_address_params)
      redirect_to root_path
    end

  private
  def buyer_params
    params.require(:buyer).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def shipping_addres_params
    params.permit(:post_code, :shipping_area_id, :municipalities, :address, :building, :telephone_number).merge(buyer_id @buyer.id)
  end
end

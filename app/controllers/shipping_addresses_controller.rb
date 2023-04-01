class ShippingAddressesController < ApplicationController
  def create
    ShippingAddress.create(shipping_address_params)
  end

  private
  def shipping_addres_params
    params.require(:shipping_address).permit(:post_code, :shipping_area_id, :municipalities, :address, :building, :telephone_number, : ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

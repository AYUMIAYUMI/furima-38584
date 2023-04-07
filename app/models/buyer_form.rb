class BuyerForm
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :municipalities, :address, :building, :telephone_number, :buyer_id, :item_id, :user_id
 


  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipping_area_id, numericality: { other_than: 1}
    validates :municipalities
    validates :telephone_number, format: {with: /\A\d{10,11}\z/}
    validates :buyer_id
    validates :user_id
    validates :item_id
  end
  def save
    buyer= Buyer.create(user_id: user_id, item_id: @item.id)

    ShippingAddress.create(post_code: post_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, telephone_number: telephone_number, buyer_id: buyer_id)
  end


  
end
class BuyerForm
  include ActiveModel::Model
  attr_accessor :item, :user, :post_code, :shipping_area_id, :municipalities, :address, :building, :telephone_number

  validates :item,             presence: true
  validates :user,             presence: true
  validates :post_code,        presence: true, format: {with: /\A\d{3}[-]\d{2}\z/}
  validates :shipping_area_id, presence: true
  validates :municipalities,   presence: true
  validates :address,          presence: true
  validates :telephone_number, presence: true, format: {with: /\A\d{10,11}\z/}

  def save
    Buyer.create(item)
    Buyer.create(user)

    ShippingAddress.create(post_code: post_code)
    ShippingAddress.create(shipping_area_id: shipping_area_id)
    ShippingAddress.create( municipalities: municipalities)
    ShippingAddress.create(address: address)
    ShippingAddress.create(building: building)
    ShippingAddress.create(telephone_number: telephone_number)
  end
  
end
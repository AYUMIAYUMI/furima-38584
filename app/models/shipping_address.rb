class ShippingAddress < ApplicationRecord

  validates :post_code,        presence: true, format: {with: /\A\d{3}[-]\d{2}\z/}
  validates :shipping_area_id, presence: true
  validates :municipalities,   presence: true
  validates :address,          presence: true
  validates :telephone_number, presence: true, format: {with: /\A\d{10,11}\z/}

  belongs_to: buyer
end

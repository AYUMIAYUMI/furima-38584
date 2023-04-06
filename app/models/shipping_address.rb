class ShippingAddress < ApplicationRecord
  belongs_to :buyer
  #belongs_to :shipping_area
end

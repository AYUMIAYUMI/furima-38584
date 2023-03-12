class Item < ApplicationRecord

  validates :product_name,     presence: true
  validates :discription,      presence: true
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                  format: { with: /\A[0-9]+\z/ }
  validates :shipping_area_id,  presence: true
  validates :shipping_day_id,   presence: true
  validates :shipping_info_id,  presence: true
  validates :image,             presence: true

   belongs_to: user
  # has_one: buyer

end

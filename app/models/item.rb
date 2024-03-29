class Item < ApplicationRecord
  validates :product_name,     presence: true
  validates :discription,      presence: true
  validates :category_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,     presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,            presence: true,
                               numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :shipping_area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" }

  validates :shipping_info_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_info
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image
  has_one :buyer
end

class Item < ApplicationRecord




  validates :product_name,     presence: true
  validates :discription,      presence: true
  validates :category_id,      numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id,      numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price,            presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                  format: { with: /\A[0-9]+\z/ }
  validates :shipping_area_id,   numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_day_id,    numericality: { other_than: 1 , message: "can't be blank"}


  validates :shipping_info_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :image,             presence: true

  validates :title, :text, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_info
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image
  # has_one: buye

end

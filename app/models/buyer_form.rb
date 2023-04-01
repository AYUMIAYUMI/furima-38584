class BuyerForm
  include ActiveModel::Model
  attr_accessor :item, :user
  

  # ここにバリデーションの処理を書く
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item
  belongs_to :user
  has_one_attached :shipping_address
  def save
    
  end
end
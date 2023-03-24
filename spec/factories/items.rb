FactoryBot.define do
  factory :item do
    product_name { '商品名' }
    discription { '商品の情報です。' }
    category_id { '2' }
    condition_id { '2' }
    price { '10000' }
    shipping_area_id { '2' }
    shipping_day_id { '2' }
    shipping_info_id { '2' }
    user_id {'1'}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end

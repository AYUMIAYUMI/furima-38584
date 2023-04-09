FactoryBot.define do
  factory :buyer_form do
    post_code {'123-4567'}
    shipping_area_id {'3'}
    municipalities {'青山1-1-1'}
    telephone_number {'09012345678'}
    building {'青山ビル'}

    association :buyer
  end
end

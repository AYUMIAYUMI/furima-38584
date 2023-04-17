FactoryBot.define do
  factory :buyer_form do
    post_code { '123-4567' }
    shipping_area_id { '3' }
    address { '横浜市緑区' }
    municipalities { '青山1-1-1' }
    telephone_number { '09012345678' }
    building { '青山ビル' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

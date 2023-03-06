FactoryBot.define do
  factory :user do
    nick_name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name_kannji { '山田' }
    second_name_kannji { '太郎' }
    first_name_kana { 'ヤマダ' }
    second_name_kana { 'タロウ' }
    date_birth { '2000-2-2' }
  end
end

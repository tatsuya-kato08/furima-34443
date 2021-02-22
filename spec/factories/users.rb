FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name            {Gimei.name.first}
    family_name           {Gimei.name.last}
    first_name_kana       {Gimei.first.katakana}
    family_name_kana      {Gimei.last.katakana}
    birthday              {Faker::Date.birthday}
  end
end
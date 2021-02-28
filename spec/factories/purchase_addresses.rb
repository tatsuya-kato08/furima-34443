FactoryBot.define do
  factory :purchase_address do
    code        { "123-4567" }
    area_id     { 2 }
    city        { "中央区" }
    number      { "日本橋1-1-1" }
    phone       { "09012345678" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end

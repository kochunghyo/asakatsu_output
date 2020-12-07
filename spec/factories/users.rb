FactoryBot.define do
  
  factory :user do
    nickname                 {"taro"}
    email                    {"abc@gmail.com"}
    password                 {"0000000"}
    encrypted_password       {"0000000"}
    last_name                {"佐藤"}
    first_name               {"太郎"}
    last_name_kana           {"サトウ"}
    first_name_kana          {"タロウ"}
    birthday                 {"1995-1-31"}
  end
end
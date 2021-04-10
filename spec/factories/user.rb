FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"a1"+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {"1990-01-01"}
    first_name            {"藤原"}
    last_name             {"雅之"}
    first_name_kana        {"フジワラ"}
    last_name_kana        {"マサユキ"}
  end
end
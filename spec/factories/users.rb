FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {Faker::Date.birthday}
    family_name           {Gimei.name.last}
    first_name            {Gimei.name.first}
    family_name_kana      {Gimei.name.last.katakana}
    first_name_kana       {Gimei.name.first.katakana}
  end
end
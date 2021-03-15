FactoryBot.define do
    factory :user do
      nickname              {Faker::Name.initials(number: 2)}
      email                 {Faker::Internet.email}
      password              {Faker::Internet.password(min_length: 8)}
      name_kanji_myoji {'砂糖'}
      name_kanji_namae {'黒砂糖'}
      name_katakana_namae {'サトウ'}
     name_katakana_myoji {'クロサトウ'}
     birth_day {'2001-05-28'}
    
    end
  end
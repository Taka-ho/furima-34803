FactoryBot.define do
    factory :user do
      nickname              {Faker::Name.initials(number: 10)}
      email                 {Faker::Internet.email}
      password_confirmation    {'aa11bb'}
      password {'aa11bb'}
      name_kanji_myoji {'砂糖'}
      name_kanji_namae {'黒砂糖'}
      name_katakana_namae {'サトウ'}
      name_katakana_myoji {'クロサトウ'}
      birth_day {'2001-05-28'}
    
    end
  end 
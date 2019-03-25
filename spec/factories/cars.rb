FactoryBot.define do
  factory :car do
    make { Faker::Lorem.word }
    year { Faker::Number.number(4) }
    model { Faker::Lorem.word }
    trim { Faker::Lorem.word }
    created_by { Faker::Number.number(10) }
  end
end

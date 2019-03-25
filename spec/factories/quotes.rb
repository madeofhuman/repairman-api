FactoryBot.define do
  factory :quote do
    description { Faker::Lorem.word}
    car_id { nil }
  end
end

FactoryBot.define do
  factory :comment do
    description { Faker::Lorem.sentence }
    quote_id { nil }
  end
end

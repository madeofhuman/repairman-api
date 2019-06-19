FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'foo@bar.com' }
    password { 'foobar' }

    trait :admin do
      admin { true }
    end
  end
end

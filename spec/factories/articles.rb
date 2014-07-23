# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    user
    title { Faker::Company.catch_phrase }
    body { Faker::Lorem.paragraph(2) }
    end
end

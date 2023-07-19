FactoryBot.define do
  factory :category do
    name { Faker::Name.unique.name }
    description { Faker::Address.full_address }
  end
end
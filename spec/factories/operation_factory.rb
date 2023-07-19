FactoryBot.define do
  factory :operation do
    amount { 100 }
    description { "Sample operation" }
    odate { Date.today }
    association :category
  end
end

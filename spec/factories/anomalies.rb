FactoryBot.define do
  factory :anomaly do
    title { Faker::Book.title }
    content { Faker::Lorem.sentence }
    user
  end
end

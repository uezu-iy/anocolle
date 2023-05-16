FactoryBot.define do
  factory :comment do
    user
    anomaly
    comment_content { Faker::Lorem.sentence }
  end
end

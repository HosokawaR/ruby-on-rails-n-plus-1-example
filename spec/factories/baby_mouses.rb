FactoryBot.define do
  factory :baby_mouse do
    sequence(:name) { |n| "Baby Mouse #{n}" }
    association :mouse
  end
end

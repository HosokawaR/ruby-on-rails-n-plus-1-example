FactoryBot.define do
  factory :mouse do
    sequence(:name) { |n| "Mouse #{n}" }
  end
end

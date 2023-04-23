FactoryBot.define do
  factory :episode do
    number { FFaker::Number.number(digits: 2) }
  end
end

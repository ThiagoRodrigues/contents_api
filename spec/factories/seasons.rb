FactoryBot.define do
  factory :season do
    number { FFaker::Number.number(digits: 2) }

    trait :with_episodes do
      transient do
        episodes_count { 5 }
      end

      after(:create) do |season, evaluator|
        create_list(:episode, evaluator.episodes_count, season: season)
      end
    end
  end
end

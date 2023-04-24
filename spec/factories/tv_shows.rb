FactoryBot.define do
  factory :tv_show do
    title { FFaker::Movie.title }
    original_title { FFaker::Movie.title }
    order { FFaker::Number.number(digits: 2) }
    year { FFaker::Number.number(digits: 4) }
    type { 'TvShow' }


    trait :with_seasons do
      transient do
        seasons_count { 2 }
      end

      after(:create) do |tv_show, evaluator|
        create_list(:season, evaluator.seasons_count, :with_episodes, tv_show: tv_show)
      end
    end
  end
end

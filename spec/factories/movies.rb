FactoryBot.define do
  factory :movie do
    title { FFaker::Movie.title }
    original_title { FFaker::Movie.title }
    order { FFaker::Number.number(digits: 2) }
    year { FFaker::Number.number(digits: 4) }
    type { 'Movie' }
  end
end

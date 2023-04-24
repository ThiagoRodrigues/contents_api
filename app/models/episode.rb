class Episode < ApplicationRecord
  belongs_to :season, inverse_of: :episodes

  validates :number, presence: true
end

class Episode < ApplicationRecord
  belongs_to :season

  validates :number, presence: true
end

class Content < ApplicationRecord
  self.inheritance_column = :type

  validates :title, :original_title, :year, presence: true

  scope :ordered, ->(direction: :asc) { order(order: direction.to_sym) }
  scope :movies, -> { where(type: 'Movie') }
  scope :tv_shows, -> { where(type: 'TvShow').includes(seasons: :episodes) }
end

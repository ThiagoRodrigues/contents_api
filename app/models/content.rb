class Content < ApplicationRecord
  self.inheritance_column = :type

  validates :title, :original_title, :year, presence: true

  scope :ordered, ->(direction: :asc) { order(order: direction.to_sym) }

  def self.cache_key
    {
      serializer: 'contents',
      stat_record: Content.maximum(:updated_at)
    }
  end
end

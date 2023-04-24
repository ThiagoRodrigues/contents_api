class ContentSerializer < ActiveModel::Serializer
  attributes :id, :title, :original_title, :year, :type, :order

  has_many :seasons, each_serializer: SeasonSerializer, if: -> { object.is_a?(TvShow) }
end


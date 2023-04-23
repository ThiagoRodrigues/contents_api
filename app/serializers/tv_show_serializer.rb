class TvShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :original_title, :year, :type, :order, :seasons

  has_many :seasons, each_serializer: SeasonSerializer
end

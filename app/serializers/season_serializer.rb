class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :number, :episodes

  belongs_to :tv_show
  has_many :episodes, each_serializer: EpisodeSerializer
end

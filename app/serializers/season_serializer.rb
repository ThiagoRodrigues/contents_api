class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :number, :episodes

  belongs_to :tv_show

  def episodes
    object.episodes.map do |episode|
      EpisodeSerializer.new(episode, root: true)
    end
  end
end

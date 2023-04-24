class TvShow < Content
  has_many :seasons, dependent: :destroy
  has_many :episodes, through: :seasons
end

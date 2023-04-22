# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   moviess = movies.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movies: moviess.first)

content_entries = [
  { title: 'Um Sonho de Liberdade', original_title: 'The Shawshank Redemption', year: 1994, type: 'Movie', order: 1 },
  { title: 'O Poderoso Chefão', original_title: 'The Godfather', year: 1972, type: 'Movie', order: 2 },
  { title: 'Pulp Fiction: Tempo de Violência', original_title: 'Pulp Fiction', year: 1994, type: 'Movie', order: 3 },
  { title: 'Forrest Gump: O Contador de Histórias', original_title: 'Forrest Gump', year: 1994, type: 'Movie', order: 4 },
  { title: 'Batman: O Cavaleiro das Trevas', original_title: 'The Dark Knight', year: 2008, type: 'Movie', order: 5 },
  { title: 'Clube da Luta', original_title: 'Fight Club', year: 1999, type: 'Movie', order: 6 },
  { title: 'Matrix', original_title: 'The Matrix', year: 1999, type: 'Movie', order: 7 },
  { title: 'Star Wars: Episódio IV - Uma Nova Esperança', original_title: 'Star Wars', year: 1977, type: 'Movie', order: 8 },
  { title: 'O Senhor dos Anéis: A Sociedade do Anel', original_title: 'The Fellowship of the Ring', year: 2001, type: 'Movie', order: 9 },
  { title: 'O Rei Leão', original_title: 'The Lion King', year: 1994, type: 'Movie', order: 10 },
  { title: 'Friends', original_title: 'Friends', year: 1994, type: 'TvShow', order: 11, seasons: 10, episodes: 236 },
  { title: 'Breaking Bad', original_title: 'Breaking Bad', year: 2008, type: 'TvShow', order: 12, seasons: 5, episodes: 62},
  { title: 'Game of Thrones', original_title: 'Game of Thrones', year: 2011, type: 'TvShow', order: 13, seasons: 8, episodes: 73},
  { title: 'Stranger Things', original_title: 'Stranger Things', year: 2016, type: 'TvShow', order: 14, seasons: 4, episodes: 34},
  { title: 'Narcos', original_title: 'Narcos', year: 2015, type: 'TvShow', order: 15, seasons: 3, episodes: 30},
  { title: 'Chaves', original_title: 'El Chavo del Ocho', year: 1972, type: 'TvShow', order: 16, seasons: 8, episodes: 290},
  { title: 'Friends: A Reunião', original_title: 'Friends: The Reunion', year: 2021, type: 'TvShow', order: 17, seasons: 1, episodes: 1},
  { title: 'Black Mirror', original_title: 'Black Mirror', year: 2011, type: 'TvShow', order: 18, seasons: 5, episodes: 22},
  { title: 'The Crown', original_title: 'The Crown', year: 2016, type: 'TvShow', order: 19, seasons: 5, episodes: 50},
  { title: 'La Casa de Papel', original_title: 'Money Heist', year: 2017, type: 'TvShow', order: 20, seasons: 5, episodes: 65}
]


content_entries.each do |content_entry|
  content = Content.create!(content_entry.except(:seasons, :episodes))

  if content.is_a?(TvShow)
    seasons = content_entry.fetch(:seasons, 0)
    episodes = content_entry.fetch(:episodes, 0)

    seasons.times do |season_number|
      season = content.seasons.create!(number: season_number + 1)

      episodes.times do |episode_number|
        season.episodes.create!(number: episode_number + 1)
      end
    end
  end
end




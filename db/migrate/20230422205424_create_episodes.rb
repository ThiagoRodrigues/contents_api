class CreateEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :episodes do |t|
      t.string :number, index: true
      t.integer :season_id

      t.timestamps
    end
  end
end

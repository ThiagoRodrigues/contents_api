class CreateTvShows < ActiveRecord::Migration[7.0]
  def change
    create_table :tv_shows do |t|

      t.timestamps
    end
  end
end

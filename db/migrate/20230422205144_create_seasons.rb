class CreateSeasons < ActiveRecord::Migration[7.0]
  def change
    create_table :seasons do |t|
      t.string :number, index: true
      t.integer :tv_show_id

      t.timestamps
    end
  end
end

class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.integer :order, index: true
      t.integer :year
      t.string :type, default: 'Movie'
      t.string :title
      t.string :original_title

      t.timestamps
    end
  end
end

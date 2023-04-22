class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :order, index: true
      t.string :type, default: 'Movie'
      t.string :title
      t.string :original_title
      t.string :year

      t.timestamps
    end
  end
end

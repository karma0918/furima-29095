class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.integer :category_id
      t.integer :condition_id
      t.integer :cost_id
      t.integer :area_id
      t.integer :way_time_id
      
      t.timestamps
    end
  end
end

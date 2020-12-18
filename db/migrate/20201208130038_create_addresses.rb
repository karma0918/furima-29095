class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal
      t.string :area
      t.string :city
      t.string :address
      t.string :building
      t.integer :phone
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end

class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.integer :rent
      t.float :latitude
      t.float :longitude
      t.string :description
      t.integer :rooms
      t.integer :intcount
      t.boolean :gmaps
      t.timestamps
    end
  end
end

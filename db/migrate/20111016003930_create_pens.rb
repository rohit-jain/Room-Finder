class CreatePens < ActiveRecord::Migration
  def change
    create_table :pens do |t|
      t.float :latitude
      t.float :longitude
      t.string :vicinity
      t.string :name
      t.string :icon
      t.string :types
      t.string :url
      t.integer :listing_id
      t.boolean :gmaps

      t.timestamps
    end
  end
end

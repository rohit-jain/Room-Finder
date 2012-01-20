class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :user_id
      t.integer :listing_id
      
      t.timestamps
    end
    add_index :tips, [:user_id, :listing_id]
  end
  def self.down
    drop_table :tips
  end
end

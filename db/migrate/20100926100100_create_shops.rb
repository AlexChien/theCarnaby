class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :coordinate
      t.string :province
      t.string :city
      t.integer :shop_type,:default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :shops
  end
end

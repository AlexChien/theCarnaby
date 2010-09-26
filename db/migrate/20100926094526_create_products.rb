class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.integer :brand_id
      t.integer :price
      t.string :sku
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end

class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.integer :brand_id
      t.decimal :price, :precision => 8, :scale => 2, :default => 0
      t.string :sku
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end

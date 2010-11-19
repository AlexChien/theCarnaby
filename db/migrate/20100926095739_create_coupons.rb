class CreateCoupons < ActiveRecord::Migration
  def self.up
    create_table :coupons do |t|
      t.string :name
      t.text :description
      t.decimal :discount, :precision => 8, :scale => 2, :default => 0
      t.integer :product_id
      t.integer :brand_id
      t.integer :shop_id

      t.timestamps
    end
  end

  def self.down
    drop_table :coupons
  end
end

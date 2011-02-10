class AddEnColumnsToCoupon < ActiveRecord::Migration
  def self.up
    add_column :coupons, :name_en, :string
    add_column :coupons, :description_en, :text
  end

  def self.down
    remove_column :coupons, :description_en
    remove_column :coupons, :name_en
  end
end

class FixShopColumns < ActiveRecord::Migration
  def self.up
    remove_column :shops, :description
    remove_column :shops, :shop_type
    
    add_column :shops, :name_en, :string
    add_column :shops, :address_en, :string
    add_column :shops, :province_en, :string
    add_column :shops, :city_en, :string
    
    add_column :shops, :shop_type_id, :integer, :default => 1
  end

  def self.down
    remove_column :shops, :shop_type_id
    remove_column :shops, :city_en
    remove_column :shops, :province_en
    remove_column :table_name, :city_en
    remove_column :shops, :name_en
  end
end
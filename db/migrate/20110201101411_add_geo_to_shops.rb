class AddGeoToShops < ActiveRecord::Migration
  def self.up
    remove_column :shops, :coordinate
    
    add_column :shops, :longtitude, :string
    add_column :shops, :latitude, :string
  end

  def self.down
    remove_column :shops, :latitude
    remove_column :shops, :longitude
  end
end
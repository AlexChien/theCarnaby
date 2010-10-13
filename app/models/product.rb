class Product < ActiveRecord::Base
  has_many :assets, :as=>:resource, :dependent=>:destroy
  belongs_to :brand

  named_scope :sku_contain, lambda {|sku|{:conditions => ["products.sku LIKE ?", "%#{sku}%"]}}
  named_scope :name_contain, lambda {|name|{:conditions => ["products.name LIKE ?", "%#{name}%"]}}
  named_scope :description_contain, lambda {|description|{:conditions => ["products.description LIKE ?", "%#{description}%"]}}

  validates_presence_of :sku,:name,:price,:description,:brand_id
  validates_uniqueness_of :sku
  validates_numericality_of :price,:greater_than_or_equal_to=>0
end

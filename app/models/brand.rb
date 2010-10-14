class Brand < ActiveRecord::Base
  has_many :assets, :as=>:resource, :dependent=>:destroy
  has_many :products
  has_many :coupons

  named_scope :name_contain, lambda {|name|{:conditions => ["brands.name LIKE ?", "%#{name}%"]}}
  named_scope :description_contain, lambda {|description|{:conditions => ["brands.description LIKE ?", "%#{description}%"]}}

  validates_presence_of :name,:description
end

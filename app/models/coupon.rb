class Coupon < ActiveRecord::Base
  belongs_to :product
  belongs_to :brand
  belongs_to :shop
  
  validates_presence_of :name,:discount,:description,:name_en,:description_en#,:product_id,:shop_id
  
  validates_numericality_of :discount,:greater_than_or_equal_to=>0
end

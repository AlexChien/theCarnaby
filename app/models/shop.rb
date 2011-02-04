class Shop < ActiveRecord::Base
  has_many :coupons
  has_many :assets, :as => :resource, :dependent => :destroy
  
  named_scope :name_contain, 
    lambda {|name|{:conditions => ["shops.name LIKE ? or shops.name_en like ?", "%#{name}%", "%#{name}%"]}}
  named_scope :address_contain, 
    lambda {|address|{:conditions => ["shops.address LIKE ? or shops.address_en like ?", "%#{address}%", "%#{address}%"]}}
  named_scope :province_contain, 
    lambda {|province|{:conditions => ["shops.province LIKE ? or shops.province_en like ?", "%#{province}%", "%#{province}%"]}}
  named_scope :city_contain, 
    lambda {|city|{:conditions => ["shops.city LIKE ? or shops.city_en like ?", "%#{city}%", "%#{city}%"]}}
  
  validates_presence_of :name,:address,:province,:name_en,:address_en,:province_en
  
  RETAIL    = 1
  WHOLESALE = 2

  def display_shop_type
    case self.shop_type_id
    when RETAIL
      "零售"
    when WHOLESALE
      "批发"
    end
  end

end

class Shop < ActiveRecord::Base
  has_many :coupons
  
  named_scope :name_contain, lambda {|name|{:conditions => ["shops.name LIKE ?", "%#{name}%"]}}
  named_scope :address_contain, lambda {|address|{:conditions => ["shops.address LIKE ?", "%#{address}%"]}}
  named_scope :province_contain, lambda {|province|{:conditions => ["shops.province LIKE ?", "%#{province}%"]}}
  named_scope :city_contain, lambda {|city|{:conditions => ["shops.city LIKE ?", "%#{city}%"]}}
  named_scope :description_contain, lambda {|description|{:conditions => ["shops.description LIKE ?", "%#{description}%"]}}
  named_scope :shop_type_equal, lambda {|shop_type|{:conditions => ["shops.shop_type = ?", shop_type]}}

  validates_presence_of :name,:address,:province,:city,:description

  def display_shop_type
    if self.shop_type  == 1
      "是"
    else
      "否"
    end
  end

end

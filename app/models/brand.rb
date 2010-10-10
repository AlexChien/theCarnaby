class Brand < ActiveRecord::Base
  named_scope :name_contain, lambda {|name|{:conditions => ["brands.name LIKE ?", "%#{name}%"]}}
  named_scope :description_contain, lambda {|description|{:conditions => ["brands.description LIKE ?", "%#{description}%"]}}

  validates_presence_of :name,:description
end

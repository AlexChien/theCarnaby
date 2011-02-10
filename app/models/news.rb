class News < ActiveRecord::Base
  has_many :assets, :as=>:resource, :dependent=>:destroy
  validates_presence_of :title, :body
  
  named_scope :title_contain, 
    lambda{ |title| { :conditions => ["news.title like ? or news.title_en like ?", "%#{title}%", "%#{title}%"] } }
  named_scope :body_contain, 
    lambda{ |body| { :conditions => ["news.body like ? or news.body_en like ?", "%#{title}%", "%#{title}%"] } }
  
  named_scope :published, :conditions => {:published => true}
  named_scope :unpublished, :conditions => {:published => false}
  
end

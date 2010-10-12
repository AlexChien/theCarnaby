class Asset < ActiveRecord::Base
  belongs_to :brand
  belongs_to :resource,:polymorphic => true
  
  has_attached_file :uploaded_data,
                    :url=>"/images/assets/:attachment/:id/:style/:filename",
                    :path=>":rails_root/public/images/assets/:attachment/:id/:style/:filename"
                    
  validates_attachment_presence :uploaded_data,:message=>"请选择上传图片"
end

class Asset < ActiveRecord::Base
  belongs_to :brand
  belongs_to :shops
  belongs_to :resource,:polymorphic => true
  
  has_attached_file :uploaded_data,
                    :url => "/images/assets/:attachment/:id/:style/:normalized_filename",
                    :path => ":rails_root/public/images/assets/:attachment/:id/:style/:normalized_filename",
                    :styles => {:thumb => "150x150", :android => "450x"}
                    
  Paperclip.interpolates :normalized_filename do |attachment, style|
    attachment.instance.normalized_filename
  end
  
  def normalized_filename
    "#{self.resource_type}-#{self.uploaded_data_file_name.gsub(/[^a-zA-Z0-9_\.]/, '_')}" 
  end      
  
  validates_attachment_presence :uploaded_data,:message=>"请选择上传图片"
  
end

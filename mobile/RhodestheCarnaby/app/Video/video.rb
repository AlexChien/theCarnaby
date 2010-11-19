# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Video
 # include Rhom::PropertyBag
  include Rhom::FixedSchema

  # Uncomment the following line to enable sync with Brand.
  # enable :sync

  #add model specifc code here
  
  set :schema_version, '0.2' #application may use it for data migration
 
  # object properties 
  property :id, :integer
  property :title, :string
  property :description, :text
  # property :shop_id, :integer
  # property :brand_id, :integer
  # property :collection_id, :integer
  # property :product_id, :integer
  # property :image_id, :integer
  # property :tag, :string
  # property :sku, :string

  property :url, :string #远程视频地址
  property :path, :string #本地视频路径

  property :updated_at, :datetime

  # blob fields called out explicitly to identify field type
  # :blob - declare property as a blob type
  # :overwrite - (optional) overwrite client copy of blob with new copy from server
  #                    useful when server modifies images, for example zooming or cropping
  # property :cropped_image_url, :blob, :overwrite
 
 
  # object column will be added by rhom and  will be primary key
 
  #indexes
  # index :by_name_tag, [:name, :tag] #will create index for name and tag columns
  index :by_video_id_title, [:id, :title]
 
  # unique_index :by_phone, [:phone] #will create unique index for phone column
  unique_index :by_video_id, [:id]
end
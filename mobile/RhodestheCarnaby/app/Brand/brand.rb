# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Brand
  # include Rhom::PropertyBag
  include Rhom::FixedSchema

  # Uncomment the following line to enable sync with Brand.
  # enable :sync

  #add model specifc code here
  
  set :schema_version, '0.2' #application may use it for data migration
 
  # object properties 
  property :id, :integer
  property :name, :string
  # property :tag, :string
  property :description, :string
  # property :logo, :string
  property :logo_file_name, :string
  property :logo_url, :string
  property :updated_at, :datetime
  property :logo_updated_at, :datetime
  property :logo_image, :blob, :overwrite
 
  # blob fields called out explicitly to identify field type
  # :blob - declare property as a blob type
  # :overwrite - (optional) overwrite client copy of blob with new copy from server
  #                    useful when server modifies images, for example zooming or cropping
  # property :cropped_image_url, :blob, :overwrite
 
 
  # object column will be added by rhom and  will be primary key
 
  #indexes
  # index :by_name_tag, [:name, :tag] #will create index for name and tag columns
  index :by_brand_id_name, [:id, :name]
 
  # unique_index :by_phone, [:phone] #will create unique index for phone column
  unique_index :by_brand_id, [:id]
  
end

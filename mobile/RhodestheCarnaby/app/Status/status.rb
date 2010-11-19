# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Status
  # include Rhom::PropertyBag
  include Rhom::FixedSchema

  # Uncomment the following line to enable sync with Brand.
  # enable :sync

  #add model specifc code here
  
  set :schema_version, '0.2' #application may use it for data migration
 
  # object properties 
  property :init_data, :integer

end

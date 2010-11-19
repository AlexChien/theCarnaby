class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer :resource_id
      t.string :resource_type
      t.string :uploaded_data_file_name
      t.string :uploaded_data_content_type
      t.integer :uploaded_data_file_size
      t.datetime :uploaded_data_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end

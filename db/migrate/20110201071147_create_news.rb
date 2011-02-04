class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title
      t.string :title_en
      t.text :body
      t.text :body_en
      t.date :news_date
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end

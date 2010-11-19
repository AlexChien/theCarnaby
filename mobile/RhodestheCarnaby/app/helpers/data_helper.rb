module DataHelper

  def create_brand(brand_hash)
    Brand.create(:id              => brand_hash["id"],
                 :name            => brand_hash["name"],
                 :logo_url        => brand_hash["logo_url"],
                 :updated_at      => brand_hash["updated_at"],
                 :logo_updated_at => brand_hash["logo_updated_at"],
                 :logo_file_name  => brand_hash["logo_file_name"],
                 :description     => brand_hash["description"]
                 )
  end

  def update_brand(brand_object,new_attributes_hash)
    brand_object.update_attributes(:id              => new_attributes_hash["id"],
                                   :name            => new_attributes_hash["name"],
                                   :logo_url        => new_attributes_hash["logo_url"],
                                   :updated_at      => new_attributes_hash["updated_at"],
                                   :logo_updated_at => new_attributes_hash["logo_updated_at"],
                                   :logo_file_name  => new_attributes_hash["logo_file_name"],
                                   :description     => new_attributes_hash["description"]
                                   )    
  end
  
  def create_collection(collection_hash)
    Collection.create(:id              => collection_hash["id"],
                      :name            => collection_hash["name"],
                      :brand_id        => collection_hash["brand_id"],
                      :description     => collection_hash["description"]
                      )
  end
  
  def update_collection(collection_object,new_attr_hash)
    collection_object.update_attributes(:id              => new_attr_hash["id"],
                                        :name            => new_attr_hash["name"],
                                        :brand_id        => new_attr_hash["brand_id"],
                                        :description     => new_attr_hash["description"]
                                        )
  end

  def create_product(product_hash)
    Product.create(:id               => product_hash["id"],
                   :name             => product_hash["name"],
                   :sku              => product_hash["sku"],                 
                   :price            => product_hash["price"],                 
                   :description      => product_hash["description"],
                   :brand_id         => product_hash["brand_id"],   
                   :collection_id    => product_hash["collection_id"],  
                   :image_url        => product_hash["image_url"],
                   :image_file_name  => product_hash["image_file_name"],
                   :updated_at       => product_hash["updated_at"],
                   :image_updated_at => product_hash["image_updated_at"]  
                   )
  end


  def create_coupon(coupon_hash)
    Coupon.create(:id               => coupon_hash["id"],
                  :title            => coupon_hash["title"],
                  :detail           => coupon_hash["detail"],                 
                  :state            => coupon_hash["state"],
                  :discount         => coupon_hash["discount"],
                  :image_file_name  => coupon_hash["image_file_name"],
                  :image_url        => coupon_hash["image_url"],
                  :updated_at       => coupon_hash["updated_at"],
                  :image_updated_at => coupon_hash["image_updated_at"]             
                  )
  end

  def create_shop(shop_hash)
    Shop.create(:id          => shop_hash["id"],
                :shop_type   => shop_hash["shop_type"],    
                :name        => shop_hash["name"],
                :description => shop_hash["description"],
                :province    => shop_hash["province"],
                :city        => shop_hash["city"],
                :address     => shop_hash["address"],
                :name_en        => shop_hash["name_en"],
                :description_en => shop_hash["description_en"],
                :address_en     => shop_hash["address_en"],
                :province_en    => shop_hash["province_en"],
                :city_en        => shop_hash["city_en"],
                :latitude    => shop_hash["latitude"],
                :latitude    => shop_hash["latitude"],
                :updated_at  => shop_hash["updated_at"]
                )
  end

  def create_video(video_hash)
    Video.create(:id          => video_hash["id"],
                 :title       => video_hash["name"],
                 :description => video_hash["description"],                 
                 :url         => video_hash["url"],
                 :path        => video_hash["path"],
                 :updated_at  => video_hash["updated_at"]
                 )
  end


  # def import_init_data
  #   db = ::Rho::RHO.get_user_db()    #If you don't change partition in your models, default partition is user
  #   db.start_transaction
  #   begin
  #     items.each do |item|
  #       data = {:field1 => item['value1'], :field2 => item['value2'] } # create hash of field\value pairs
  #       new_item = Model.create(data) # will create new Model object and save it to db
  #     end
  #     db.commit
  #   rescue
  #     db.rollback
  #   end  
  # end

end
require 'rho/rhocontroller'
require 'helpers/browser_helper'

class CollectionController < Rho::RhoController
  include BrowserHelper

  def save_location
    location = WebView.current_location
    puts "location: #{location}"
    @@this_page = location
  end

  #GET /Collection
  def index
    @collections = Collection.find(:all)
    render
  end

  # GET /Collection/{1}
  def show
    # save_location  
    # tabbar = [
    #   { :label => "品牌", :action => '/app/Brand', 
    #     :icon => "/public/images/carnaby/tabs/brand.png", :reload => true }, 
    #   { :label => "新品",  :action => '/app/Product',  
    #     :icon => "/public/images/carnaby/tabs/new.png" },
    #   { :label => "优惠券",  :action => '/app/Coupon',  
    #     :icon => "/public/images/carnaby/tabs/coupon.png" },
    #   { :label => "店铺",  :action => '/app/Shop',  
    #     :icon => "/public/images/carnaby/tabs/shop.png" },
    #   { :label => "更多",   :action => '/app', 
    #     :icon => "/public/images/carnaby/tabs/more.png" }
    # ]
    # NativeBar.create(Rho::RhoApplication::TABBAR_TYPE, tabbar)
    @collection = Collection.find(@params['id'])
    @@collection_page = "/app/Collection/{#{@params['id']}}/show"    
    @products = Product.find(:all,:conditions => {:collection_id => @collection.id})
    if @collection
      render :action => :show
    else
      redirect :action => :index
    end
  end
  
  def product
    NativeBar.create(Rho::RhoApplication::NOBAR_TYPE, [])
    @product = Product.find(@params['id'])
    if @product
      render :action => :product
    else
      redirect :action => :show
    end    
  end
  
 def set_tabbar 
    # save_location
    # @tabbar = [
    #   { :label => "品牌", :action => '/app/Brand', 
    #     :icon => "/public/images/carnaby/tabs/brand.png" },
    #   { :label => "新品",  :action => '/app/Product',  
    #     :icon => "/public/images/carnaby/tabs/new.png", :reload => true },   
    #   { :label => "优惠券",  :action => '/app/Coupon',  
    #     :icon => "/public/images/carnaby/tabs/coupon.png" },
    #   { :label => "店铺",  :action => '/app/Shop',  
    #     :icon => "/public/images/carnaby/tabs/shop.png" },
    #   { :label => "更多",   :action => '/app', 
    #     :icon => "/public/images/carnaby/tabs/more.png" }
    # ]
    @tabbar = [
      { :label => Localization::Views[:brands], :action => '/app/Brand', 
        :icon => "/public/images/carnaby/tabs/brand.png", :reload => true }, 
      { :label => Localization::Views[:new_products],  :action => '/app/Product',  
        :icon => "/public/images/carnaby/tabs/new.png" },
      { :label => Localization::Views[:coupons],  :action => '/app/Coupon',  
        :icon => "/public/images/carnaby/tabs/coupon.png" },
      { :label => Localization::Views[:shops],  :action => '/app/Shop',  
        :icon => "/public/images/carnaby/tabs/shop.png" },
      { :label => Localization::Views[:more],   :action => '/app', 
        :icon => "/public/images/carnaby/tabs/more.png" }
    ]    
    NativeBar.create(Rho::RhoApplication::TABBAR_TYPE, @tabbar)
    NativeBar.switch_tab(0)
    # WebView.navigate(WebView.current_location, 1)
    WebView.navigate(@@collection_page, 0)
    # render  :file => "/app/Product/index.erb"
    # render  :action => :index
  end  

  # GET /Collection/new
  def new
    @collection = Collection.new
    render :action => :new
  end

  # GET /Collection/{1}/edit
  def edit
    @collection = Collection.find(@params['id'])
    if @collection
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Collection/create
  def create
    @collection = Collection.create(@params['collection'])
    redirect :action => :index
  end

  # POST /Collection/{1}/update
  def update
    @collection = Collection.find(@params['id'])
    @collection.update_attributes(@params['collection']) if @collection
    redirect :action => :index
  end

  # POST /Collection/{1}/delete
  def delete
    @collection = Collection.find(@params['id'])
    @collection.destroy if @collection
    redirect :action => :index
  end
end

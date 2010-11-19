require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ProductController < Rho::RhoController
  include BrowserHelper
  
  
  def save_location
    location = WebView.current_location
    puts "location: #{location}"
    @@this_page = location
  end  
    

  #GET /Product
  def index
    save_location  
    @products = Product.find(:all)
    # render
    NativeBar.create(Rho::RhoApplication::NOBAR_TYPE, [])      
    render :layout => "product_show", :use_layout_on_ajax => false
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
    NativeBar.switch_tab(1)
    # WebView.navigate(WebView.current_location, 1)
    WebView.navigate(@@this_page, 1)
    # render  :file => "/app/Product/index.erb"
    # render  :action => :index
  end
  

  def set_toolbar
    # save_location
    toolbar = [
      { :label => "品牌", :action => '/app', :icon => "/public/images/carnaby/tabs/brand.png", :reload => true }, 
    {:action => :separator},      
      { :label => "新品",  :action => '/app/Product',  :icon => "/public/images/carnaby/tabs/new.png" },
    {:action => :separator},      
      { :label => "优惠券",  :action => '/app/Coupon',  :icon => "/public/images/carnaby/tabs/coupon.png" },
    {:action => :separator},      
      { :label => "店铺",  :action => '/app/Shop',  :icon => "/public/images/carnaby/tabs/shop.png" },
    {:action => :separator},      
      { :label => "更多",   :action => '/app', :icon => "/public/images/carnaby/tabs/more.png" }      
    ]
    NativeBar.create(Rho::RhoApplication::TOOLBAR_TYPE, toolbar)
    render :action => :index
  end  

  # GET /Product/{1}
  def show
    save_location    
    NativeBar.create(Rho::RhoApplication::NOBAR_TYPE, [])
    @products = Product.find(:all)
    @product = Product.find(@params['id'])
    if @product
      # render :action => :show, :layout => "product_layout", :use_layout_on_ajax => false
      render :action => :show, :layout => "product_show", :use_layout_on_ajax => false
    else
      redirect :action => :index
    end
  end

  # GET /Product/new
  def new
    @product = Product.new
    render :action => :new
  end

  # GET /Product/{1}/edit
  def edit
    @product = Product.find(@params['id'])
    if @product
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Product/create
  def create
    @product = Product.create(@params['product'])
    redirect :action => :index
  end

  # POST /Product/{1}/update
  def update
    @product = Product.find(@params['id'])
    @product.update_attributes(@params['product']) if @product
    redirect :action => :index
  end

  # POST /Product/{1}/delete
  def delete
    @product = Product.find(@params['id'])
    @product.destroy if @product
    redirect :action => :index
  end
end

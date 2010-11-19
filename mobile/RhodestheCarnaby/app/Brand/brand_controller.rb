require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'helpers/data_helper'

class BrandController < Rho::RhoController

  include BrowserHelper
  include DataHelper

  #GET /Brand
  def index
    @brands = Brand.find(:all, :order => :id)
    
    # android 才需要定制菜单，为了和iphone体验一致，菜单仅提供回退和返回主页功能
    # @menu = { 
    #   "Item Label 1" => "/item1path", 
    #   "Item Label 2" => "/item2path", 
    #   # ... 
    # } #=> overrides the default menu in a specific action
    
    # @tabs = [
    #   { :label => Localization::Views[:brands], :action => '/app/Brand', 
    #     :icon => "/public/images/carnaby/tabs/brand.png"}, 
    #   { :label => Localization::Views[:new_products],  :action => '/app/Product',  
    #     :icon => "/public/images/carnaby/tabs/new.png" },
    #   { :label => Localization::Views[:coupons],  :action => '/app/Coupon',  
    #     :icon => "/public/images/carnaby/tabs/coupon.png" },
    #   { :label => Localization::Views[:shops],  :action => '/app/Shop',  
    #     :icon => "/public/images/carnaby/tabs/shop.png" },
    #   { :label => Localization::Views[:more],   :action => '/app', 
    #     :icon => "/public/images/carnaby/tabs/more.png" }
    # ]
    # # NativeBar.create(Rho::RhoApplication::NOBAR_TYPE, [])
    # NativeBar.create(Rho::RhoApplication::TABBAR_TYPE, @tabs)
    # # NativeBar.switch_tab(0)
    # # WebView.navigate('/app/Brand', 0)
   
    update_brands if System.has_network

    render
  end

  # GET /Brand/{1}
  def show
    @brand = Brand.find(@params['id'])
    @collections = Collection.find(:all,:conditions => {:brand_id => @brand.id})
    # @brand = Brand.first    
    if @brand
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Brand/new
  def new
    @brand = Brand.new
    render :action => :new
  end

  # GET /Brand/{1}/edit
  def edit
    @brand = Brand.find(@params['id'])
    if @brand
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Brand/create
  def create
    @brand = Brand.create(@params['brand'])
    redirect :action => :index
  end

  # POST /Brand/{1}/update
  def update
    @brand = Brand.find(@params['id'])
    @brand.update_attributes(@params['brand']) if @brand
    redirect :action => :index
  end

  # POST /Brand/{1}/delete
  def delete
    @brand = Brand.find(@params['id'])
    @brand.destroy if @brand
    redirect :action => :index
  end
  
  # 获得服务器端最新品牌  
  def get_brands
    Rho::AsyncHttp.get(
            :url =>  Rho::RhoConfig.host_name + "brands.json",
            :callback => (url_for :action => :update_brands),
            :callback_param => "")
     
    @response['headers']['Wait-Page'] = 'true'
    render :action => :waiting
  end
 
  def update_brands
    puts "update_brands: #{@params}"
    if @params['status'] == 'ok'
      # @brand = Brand.new(@params['body']['brands'].first)
      # @brand.object = @brand.id
      render_transition :action => :show    
    else
      @@error_params = @params
      WebView.navigate ( url_for :action => :show_error )
    end
  end
  
  def cancel_httpcall
    Rho::AsyncHttp.cancel( url_for( :action => :update_brands) )

    @@get_result  = 'Request was cancelled.'
    render :action => :webservicetest, :back => url_for(:action => :index)
  end
  
  def show_error
    render :action => :error, :back => url_for(:action => :index)
  end
  
  def update_brands
    # if System.has_network
      @res = Rho::AsyncHttp.get( :url => Rho::RhoConfig.host_name + "brands.json")
      # puts "Sync http call: #{@res}"
      if @res['status'] == "ok"
        @remote_brands = @res['body']
        @remote_brands.each do |item|
          if brand = Brand.find(:first, :conditions => {:id => item["brand"]["id"]})
            if brand.updated_at != item["brand"]["updated_at"]
              update_brand(brand,item["brand"])
              if brand.logo_updated_at != item["brand"]["logo_updated_at"]
                update_brand_image(item["brand"])
              end 
            end
          else
            create_brand(item["brand"])
          end
          # @firstb=Brand.find(:first) #
        end
        # @parsed = Rho::JSON.parse(@remote_brands.first) #
      end
    # end    
  end
  
  def update_brand_image(brand)
    @file_name = File.join(Rho::RhoApplication::get_base_app_path(), "/public/images/carnaby/brands/#{brand['id']}.jpg")
    Rho::AsyncHttp.download_file(
        :url              => brand["logo_url"],
        :filename         => @file_name,
        :headers          => {},
        # :callback       => (url_for :action => :httpdownload_callback),
        # :callback_param => ""
    )
  end
  
end

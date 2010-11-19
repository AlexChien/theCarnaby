require 'rho/rhoapplication'
require 'helpers/data_helper'
require 'lib/init_data'

class AppApplication < Rho::RhoApplication

  # 安装应用后第一次运行时退出，需要找出原因。似乎是加入了加载初始数据代码才出现的
  include DataHelper # 
  include InitData

  def initialize

    LocalizationSimplified.requre_loc(Rho::RhoFSConnector::get_app_path('app') + 'lang/lang_',true) 

    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    # @tabs = nil
    # @@tabbar = nil

    @tabs = [
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

    # @tabs = [
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

    @@toolbar = nil
    # @@toolbar = [
    #      # {:action => :back,    :icon => '/public/images/back_btn.png'},
    #      # {:action => :forward, :icon => '/public/images/forward_btn.png'},
    #      # {:action => :separator},
    #      # {:action => :home},
    #      # {:action => :refresh},
    #      # {:action => :options}
    #      # { :label => "品牌", :action => '/app/Brand', :icon => "/public/images/carnaby/tabs/brand.png", :reload => true }, 
    #      { :label => "品牌", :action => '/app/Brand', :icon => "/public/images/carnaby/tabs/brand.png" }, 
    #    {:action => :separator},      
    #      { :label => "新品",  :action => '/app/Product',  :icon => "/public/images/carnaby/tabs/new.png" },
    #    {:action => :separator},      
    #      { :label => "优惠券",  :action => '/app/Coupon',  :icon => "/public/images/carnaby/tabs/coupon.png" },
    #    {:action => :separator},      
    #      { :label => "店铺",  :action => '/app/Shop',  :icon => "/public/images/carnaby/tabs/shop.png" },
    #    {:action => :separator},      
    #      { :label => "更多",   :action => '/app', :icon => "/public/images/carnaby/tabs/more.png" }      
    #    ]

    @tab=nil
    
    super

    # Uncomment to set sync notification callback to /app/Settings/sync_notify.
    # SyncEngine::set_objectnotify_url("/app/Settings/sync_notify")
    # SyncEngine.set_notification(-1, "/app/Settings/sync_notify", '')

    # For menu-based platforms (currently RIM and Android), 
    # the Rhodes framework provides the ability to change 
    # the native application menu items through the following simple API:

    @default_menu = {
      # "Item Label 1" => "/item1path", 
      # "Item Label 2" => "/item2path",
      # "Go Home" => :home, 
      "View Accounts" => "/app/Account", 
      # "Do Refresh" => :refresh, 
      # "Perform Sync" => :sync, 
      # "App Options" => :options, 
      # "View Log" => :log       
      # ... 
    } #=> overrides the rhodes default menu
    
    # NavBar.remove
    
    load_init_data unless Status.find(:first)

  end


  def load_init_data
     # 加载初始数据
     # Rho::RhoUtils.load_offline_data(['brands','collections'], 'data')
     # rhodes 的ruby没有Yaml库？
     # YDATD=YAML.load_file(File.join(Rho::RhoFSConnector.get_base_app_path(),'app','data','fixtures','brands'+'.yml'))
     unless data_status = Status.find(:first) && data_status.init_data == 'ok'
     # unless Status.find(:first)    
       @@init_data[:brands].each do |brand|
         create_brand(brand)
       end
       @@init_data[:collections].each do |collection|
         create_collection(collection)
       end
       @@init_data[:products].each do |product|
         create_product(product)
       end
       @@init_data[:coupons].each do |coupon|
         create_coupon(coupon)
       end
       @@init_data[:shops].each do |shop|
         create_shop(shop)
       end
       @@init_data[:videos].each do |video|
         create_video(video)
       end                        
       Status.create(:init_data => 'ok')
     end
   end

end

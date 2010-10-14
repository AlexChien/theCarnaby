# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def set_navs
    @navs ||= [
      {:name=>"管理首页", :path=>"/admin", :controller=>"admin"},
      {:name=>"品牌管理", :path=>"/brands", :controller=>"brands"},
      {:name=>"新品管理", :path=>"/products", :controller=>"products"},
      {:name =>"优惠券管理", :path =>"/coupons", :controller=>"coupons"},
      {:name=>"店铺管理", :path=>"/shops", :controller=>"shops"},
      {:name=>"视频管理", :path=>"/videos", :controller=>"videos"},
    ]
  end

  def top_menus
    set_navs
    @menu = ""
    @navs.each do |menu|
      @menu += "<li"
      @menu += " class='selected' " if controller_name == menu[:controller]
      @menu += "><a href='#{menu[:path]}'>#{menu[:name]}</a></li>"
    end
    @menu
  end

  def flash_message
    messages = ""
    [:notice, :error].each do |type|
      if flash[type]
        messages= "<div class=\"#{type} flash\">#{flash[type]}</div>"
      end
    end
    messages
  end

end
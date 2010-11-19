require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ShopController < Rho::RhoController
  include BrowserHelper

  #GET /Shop
  def index
    @shops = Shop.find(:all)
    render
  end

  # GET /Shop/{1}
  def show
    @shop = Shop.find(@params['id'])
    if @shop
      render :action => :show
    else
      redirect :action => :index
    end
  end
  
  def showmap
     puts @params.inspect
     @shop = Shop.find(@params['id'])
     @params['latitude'] = @shop.latitude
     @params['longitude'] = @shop.longitude
     #pin color
     if @params['latitude'].to_i == 0 and @params['longitude'].to_i == 0
       @params['latitude'] = '31.223793'
       @params['longitude'] = '121.445875'    
     end
     region = [@params['latitude'], @params['longitude'], 0.2, 0.2]
     #region = {:center => @params['latitude'] + ',' + @params['longitude'], :radius => 0.2}
     map_params = {
          :settings => {:map_type => "roadmap", :region => region,
                        :zoom_enabled => true, :scroll_enabled => true, :shows_user_location => true},
          :annotations => [
            {:latitude  => @params['latitude'], 
             :longitude => @params['longitude'], 
             :title     => @shop.name,
             :subtitle  => @shop.name,     
             :street_address => @shop.address,
             :url       => "/app/Shop/{#{@shop.object}}/show",
             :api_key   =>  "ABQIAAAAtS1H8Srk9GC_SH7bVtqhhhRi_j0U6kJrkFvY4-OX2XYmEAa76BQkVM4JBY7-_-Jx2afU5CajBntITw"},
            # {:latitude  => GeoLocation.latitude.to_s, 
            #  :longitude => GeoLocation.longitude.to_s,               
            #  :title          => "当前位置", 
            #  # :subtitle       => "zip: 95014", 
            #  :url            => "/app/GeoLocation/show?city=Cupertino"},
            # {:street_address => "Cupertino, CA 95014", 
            #   :title          => "Cupertino", 
            #   :subtitle       => "zip: 95014", 
            #   :url            => "/app/GeoLocation/show?city=Cupertino"},
            #  {:street_address => "Santa Clara, CA 95051", 
            #   :title          => "Santa Clara", 
            #   :subtitle       => "zip: 95051", 
            #   :url            => "/app/GeoLocation/show?city=Santa%20Clara"}
          ]
     }
     puts map_params.inspect            
     MapView.create map_params
     redirect "/app/Shop/{#{@shop.object}}/show"
  end  

  # GET /Shop/new
  def new
    @shop = Shop.new
    render :action => :new
  end

  # GET /Shop/{1}/edit
  def edit
    @shop = Shop.find(@params['id'])
    if @shop
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Shop/create
  def create
    @shop = Shop.create(@params['shop'])
    redirect :action => :index
  end

  # POST /Shop/{1}/update
  def update
    @shop = Shop.find(@params['id'])
    @shop.update_attributes(@params['shop']) if @shop
    redirect :action => :index
  end

  # POST /Shop/{1}/delete
  def delete
    @shop = Shop.find(@params['id'])
    @shop.destroy if @shop
    redirect :action => :index
  end
end

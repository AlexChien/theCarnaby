class ShopsController < ApplicationController
  
  before_filter :login_required  

  def index
    @shop = Shop
    if params[:search]
      @shop = @shop.name_contain(params[:search][:name]) unless params[:search][:name].blank?
      @shop = @shop.address_contain(params[:search][:address]) unless params[:search][:address].blank?
      @shop = @shop.province_contain(params[:search][:province]) unless params[:search][:province].blank?
      @shop = @shop.city_contain(params[:search][:city]) unless params[:search][:city].blank?
    end

    options = {:page => params[:page], :per_page => 15, :order => "created_at desc"}
    options[:include] = "assets" if request_source_for?(:android)
    
    @shops = @shop.paginate(:all, options);

    (@shops = @shop.all; render :action => "android" and return) if request_source_for?(:android)
    (@shops = @shop.all; render :action => "iphone" and return) if request_source_for?(:iphone)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(params[:shop])
    @asset = Asset.new(params[:asset])
    @shop.assets << @asset
    if @shop.save
      redirect_to(@shop, :notice => '店铺新增成功！')
    else
      render :action => "new"
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.assets.empty?
      @asset = Asset.new(params[:asset])
      @shop.assets << @asset
    else
      @shop.assets.first.update_attributes(params[:asset])
    end
    
    if @shop.update_attributes(params[:shop])
      redirect_to(@shop, :notice => '店铺更新成功！')
    else
      render :action => "edit"
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    if @shop.destroy
      flash[:notice] = @shop.name + " 删除成功"
    else
      flash[:error] = @shop.name + " 删除失败"
    end
    redirect_to shops_url
  end
  
  def android; end
  def iphone; end
end
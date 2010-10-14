class ShopsController < ApplicationController

  def index
    @shop = Shop
    if params[:search]
      @shop = @shop.name_contain(params[:search][:name]) unless params[:search][:name].blank?
      @shop = @shop.address_contain(params[:search][:address]) unless params[:search][:address].blank?
      @shop = @shop.province_contain(params[:search][:province]) unless params[:search][:province].blank?
      @shop = @shop.city_contain(params[:search][:city]) unless params[:search][:city].blank?
      @shop = @shop.description_contain(params[:search][:description]) unless params[:search][:description].blank?
      @shop = @shop.shop_type_equal(params[:search][:shop_type]) unless params[:search][:shop_type].blank?
    end
    @shops = @shop.paginate(:all,:page => params[:page],:per_page=>15,:order=>"created_at DESC")
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
    if @shop.save
      redirect_to(@shop, :notice => '店铺新增成功！')
    else
      render :action => "new"
    end
  end

  def update
    @shop = Shop.find(params[:id])
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
end

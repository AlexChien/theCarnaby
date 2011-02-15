class ProductsController < ApplicationController
  
  before_filter :login_required  

  def index
    @product = Product
    if params[:search]
      @product = @product.sku_contain(params[:search][:sku]) unless params[:search][:sku].blank?
      @product = @product.name_contain(params[:search][:name]) unless params[:search][:name].blank?
      @product = @product.description_contain(params[:search][:description]) unless params[:search][:description].blank?
    end
    @products = @product.paginate(:all,:include=>[:brand],:page => params[:page],:per_page=>15,:order=>"created_at DESC")
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])
    @asset = Asset.new(params[:asset])
    @product.assets << @asset
    if @product.save
      redirect_to(@product, :notice => '新品新增成功！')
    else
      render :action => "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.assets.empty?
      @asset = Asset.new(params[:asset])
      @product.assets << @asset
    else
      @product.assets.first.update_attributes(params[:asset])
    end
    if @product.update_attributes(params[:product])
      redirect_to(@product, :notice => '新品更新成功！')
    else
      render :action => "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = @product.name + " 删除成功"
    else
      flash[:error] = @product.name + " 删除失败"
    end
    redirect_to products_url
  end
end

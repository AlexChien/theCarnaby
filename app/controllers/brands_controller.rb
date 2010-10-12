class BrandsController < ApplicationController

  def index
    @brand = Brand
    if params[:search]
      @brand = @brand.name_contain(params[:search][:name]) unless params[:search][:name].blank?
      @brand = @brand.description_contain(params[:search][:description]) unless params[:search][:description].blank?
    end
    @brands = @brand.paginate(:all,:page => params[:page],:per_page=>15,:order=>"created_at DESC")
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def new
    @brand = Brand.new
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def create
    @brand = Brand.new(params[:brand])
    @asset = Asset.new(params[:asset])
    @brand.assets << @asset
    if @brand.save
      redirect_to(@brand, :notice => '品牌新增成功！')
    else
      render :action => "new"
    end
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update_attributes(params[:brand])
      redirect_to(@brand, :notice => '品牌更新成功！')
    else
      render :action => "edit"
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    if @brand.destroy
      flash[:notice] = @brand.name + " 删除成功"
    else
      flash[:error] = @brand.name + " 删除失败"
    end
    redirect_to brands_url
  end
end

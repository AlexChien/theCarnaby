class BrandsController < ApplicationController
  # GET /brands
  # GET /brands.xml
  def index
    @brand = Brand
    if params[:search]
      @brand = @brand.name_contain(params[:search][:name]) unless params[:search][:name].blank?
      @brand = @brand.description_contain(params[:search][:description]) unless params[:search][:description].blank?
    end
    @brands = @brand.all(:order=>"created_at DESC")
  end

  # GET /brands/1
  # GET /brands/1.xml
  def show
    @brand = Brand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brand }
    end
  end

  # GET /brands/new
  # GET /brands/new.xml
  def new
    @brand = Brand.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brand }
    end
  end

  # GET /brands/1/edit
  def edit
    @brand = Brand.find(params[:id])
  end

  # POST /brands
  # POST /brands.xml
  def create
    @brand = Brand.new(params[:brand])

    respond_to do |format|
      if @brand.save
        format.html { redirect_to(@brand, :notice => 'Brand was successfully created.') }
        format.xml  { render :xml => @brand, :status => :created, :location => @brand }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brand.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brands/1
  # PUT /brands/1.xml
  def update
    @brand = Brand.find(params[:id])

    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        format.html { redirect_to(@brand, :notice => 'Brand was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brand.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    if @brand.destroy
      flash[:notice] = @brand.name.to_s + " 删除成功"
    else
      flash[:error] = @brand.name.to_s + " 删除失败"
    end
    redirect_to brands_url
  end
end

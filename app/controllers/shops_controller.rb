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

    options = {:page => params[:page], :per_page => 30, :order => "created_at desc"}
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
  
  # download shop images for embedding in app
  def download_pics(platform="android")
    platform = params[:platform] if params[:platform]
    
    files = get_download_pics(platform)
    if files.size == 1 && !File.directory?(files.first)
      file_to_send = files.first
    else
      # pack it first in temp dir
      tempfile = Tempfile.new("shop_pics_#{platform}", "#{::Rails.root.to_s}/tmp")
      
      begin
        # tempfile.write `cd "#{File.dirname( files.first )}" && zip - -1 -r #{files.join( ' ' )}`.chomp
        Zip::ZipOutputStream.open(tempfile.path) do |z|
          files.each do |file|
            z.put_next_entry(file[:filename])
            z.print IO.read(file[:path])
          end
        end
        send_file tempfile.path,  :type => 'application/zip',
                                  :disposition => 'attachment',
                                  :filename => "shop_pics_#{platform}.zip"
        
      ensure
        tempfile.close
        # tempfile.unlink
      end
      
    end
  end
  
  def android; end
  def iphone; end
  
protected
  def get_download_pics(platform="android")
    pics = []
    Shop.all.each do |shop|
      shop.assets.each do |asset|
        path = asset.uploaded_data.path(platform.to_sym)
        pics.push({:filename => "#{shop.id}#{File.extname(path)}", :path => path})
      end
    end
    pics
  end
end

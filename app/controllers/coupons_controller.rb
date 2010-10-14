class CouponsController < ApplicationController

  def index
    @coupon = Coupon
    if params[:search]
      @coupon = @coupon.name_contain(params[:search][:name]) unless params[:search][:name].blank?
      @coupon = @coupon.description_contain(params[:search][:description]) unless params[:search][:description].blank?
    end
    @coupons = @coupon.paginate(:all,:include=>[:product,:shop,:brand],:page => params[:page],:per_page=>15,:order=>"created_at DESC")
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def new
    @coupon = Coupon.new
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def create
    @coupon = Coupon.new(params[:coupon])
    if @coupon.save
      redirect_to(@coupon, :notice => '优惠券新增成功！')
    else
      render :action => "new"
    end
  end

  def update
    @coupon = Coupon.find(params[:id])
    if @coupon.update_attributes(params[:coupon])
      redirect_to(@coupon, :notice => '优惠券更新成功！')
    else
      render :action => "edit"
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    if @coupon.destroy
      flash[:notice] = @coupon.name + " 删除成功"
    else
      flash[:error] = @coupon.name + " 删除失败"
    end
    redirect_to coupons_url
  end
end

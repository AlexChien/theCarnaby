require 'rho/rhocontroller'
require 'helpers/browser_helper'

class CouponController < Rho::RhoController
  include BrowserHelper

  #GET /Coupon
  def index
    @coupons = Coupon.find(:all)
    render
  end

  # GET /Coupon/{1}
  def show
    @coupon = Coupon.find(@params['id'])
    if @coupon
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Coupon/new
  def new
    @coupon = Coupon.new
    render :action => :new
  end

  # GET /Coupon/{1}/edit
  def edit
    @coupon = Coupon.find(@params['id'])
    if @coupon
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Coupon/create
  def create
    @coupon = Coupon.create(@params['coupon'])
    redirect :action => :index
  end

  # POST /Coupon/{1}/update
  def update
    @coupon = Coupon.find(@params['id'])
    @coupon.update_attributes(@params['coupon']) if @coupon
    redirect :action => :index
  end

  # POST /Coupon/{1}/delete
  def delete
    @coupon = Coupon.find(@params['id'])
    @coupon.destroy if @coupon
    redirect :action => :index
  end
end

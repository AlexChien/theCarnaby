require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ImageController < Rho::RhoController
  include BrowserHelper

  #GET /Image
  def index
    @images = Image.find(:all)
    render
  end

  # GET /Image/{1}
  def show
    @image = Image.find(@params['id'])
    if @image
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Image/new
  def new
    @image = Image.new
    render :action => :new
  end

  # GET /Image/{1}/edit
  def edit
    @image = Image.find(@params['id'])
    if @image
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Image/create
  def create
    @image = Image.create(@params['image'])
    redirect :action => :index
  end

  # POST /Image/{1}/update
  def update
    @image = Image.find(@params['id'])
    @image.update_attributes(@params['image']) if @image
    redirect :action => :index
  end

  # POST /Image/{1}/delete
  def delete
    @image = Image.find(@params['id'])
    @image.destroy if @image
    redirect :action => :index
  end
end

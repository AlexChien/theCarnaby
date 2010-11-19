require 'rho/rhocontroller'
require 'helpers/browser_helper'

class VideoController < Rho::RhoController
  include BrowserHelper

  #GET /Video
  def index
    @videos = Video.find(:all)
    render
  end

  # GET /Video/{1}
  def show
    @video = Video.find(@params['id'])
    if @video
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Video/new
  def new
    @video = Video.new
    render :action => :new
  end

  # GET /Video/{1}/edit
  def edit
    @video = Video.find(@params['id'])
    if @video
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Video/create
  def create
    @video = Video.create(@params['video'])
    redirect :action => :index
  end

  # POST /Video/{1}/update
  def update
    @video = Video.find(@params['id'])
    @video.update_attributes(@params['video']) if @video
    redirect :action => :index
  end

  # POST /Video/{1}/delete
  def delete
    @video = Video.find(@params['id'])
    @video.destroy if @video
    redirect :action => :index
  end
end

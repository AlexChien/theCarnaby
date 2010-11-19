require 'rho/rhocontroller'
require 'helpers/browser_helper'

class StatusController < Rho::RhoController
  include BrowserHelper

  #GET /Status
  def index
    @statuses = Status.find(:all)
    render
  end

  # GET /Status/{1}
  def show
    @status = Status.find(@params['id'])
    if @status
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Status/new
  def new
    @status = Status.new
    render :action => :new
  end

  # GET /Status/{1}/edit
  def edit
    @status = Status.find(@params['id'])
    if @status
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Status/create
  def create
    @status = Status.create(@params['status'])
    redirect :action => :index
  end

  # POST /Status/{1}/update
  def update
    @status = Status.find(@params['id'])
    @status.update_attributes(@params['status']) if @status
    redirect :action => :index
  end

  # POST /Status/{1}/delete
  def delete
    @status = Status.find(@params['id'])
    @status.destroy if @status
    redirect :action => :index
  end
end

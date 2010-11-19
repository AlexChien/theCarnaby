require 'rho/rhocontroller'
require 'helpers/browser_helper'

class SerialController < Rho::RhoController
  include BrowserHelper

  #GET /Serial
  def index
    @serials = Serial.find(:all)
    render
  end

  # GET /Serial/{1}
  def show
    @serial = Serial.find(@params['id'])
    if @serial
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Serial/new
  def new
    @serial = Serial.new
    render :action => :new
  end

  # GET /Serial/{1}/edit
  def edit
    @serial = Serial.find(@params['id'])
    if @serial
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Serial/create
  def create
    @serial = Serial.create(@params['serial'])
    redirect :action => :index
  end

  # POST /Serial/{1}/update
  def update
    @serial = Serial.find(@params['id'])
    @serial.update_attributes(@params['serial']) if @serial
    redirect :action => :index
  end

  # POST /Serial/{1}/delete
  def delete
    @serial = Serial.find(@params['id'])
    @serial.destroy if @serial
    redirect :action => :index
  end
end

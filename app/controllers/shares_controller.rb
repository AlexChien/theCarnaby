class SharesController < ApplicationController

  def index
    respond_to do |format|
      format.iphone
    end
  end

end

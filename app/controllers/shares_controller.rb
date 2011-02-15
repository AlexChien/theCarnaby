class SharesController < ApplicationController
  
  before_filter :login_required  

  def index
    respond_to do |format|
      format.iphone
    end
  end

end

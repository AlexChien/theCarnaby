# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  include AuthenticatedSystem

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def request_source_for?(platform)
    !params[:platform].blank? && params[:platform] == platform.to_s
  end
  
end
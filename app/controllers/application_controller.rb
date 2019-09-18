class ApplicationController < ActionController::Base
  include LoginHelper
  before_action :require_login
  
end

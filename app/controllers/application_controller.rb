class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instprotect from forgery
include SessionsHelper
  protect_from_forgery with: :exception
end

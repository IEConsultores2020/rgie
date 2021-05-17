class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead
  include ActiveDevice
  helper :all
  # protect_from_forgery with: :exception
  protect_from_forgery
  before_filter :prepare_for_mobile 
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
 
private

 def mobile_device?
  if session[:mobile_param]
    session[:mobile_param] == "1"
  else
    request.user_agent =~ /Mobile|webOS/
  end
 end
 helper_method :mobile_device?


 def prepare_for_mobile
  session[:mobile_param] = params[:mobile] if params[:mobile]
  request.format = :mobile if mobile_device?
 end
  
  rescue_from CanCan::AccessDenied do |exception|
   flash[:error] = "Access denied! on #{exception.action} #{exception.subject.inspect}"
   redirect_to root_url
  end


  protected
	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) << :name
	  devise_parameter_sanitizer.for(:account_update) << :name
	end


end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) do |u|
  		u.permit(
  			:email,
  			:name,
  			:password,
  			:password_confirmation	
  			)
 end

	devise_parameter_sanitizer.for(:account_update) do |u|
		u.permit(
			:current_password,
			:email,
  			:name,
  			:password,
  			:password_confirmation	
			)
	end
end
end
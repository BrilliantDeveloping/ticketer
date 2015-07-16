class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  rescue_from DeviseLdapAuthenticatable::LdapException do |exc|
    render text: exc, status: 500
  end 
  
  before_action :set_model_name, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  protected
  
  def set_model_name
    @m = Kernel.const_get(controller_name.classify)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :username, 
      :email, 
      :password, 
      :password_confirmation, 
      :remember_me
    ) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(
      :login, 
      :username, 
      :email, 
      :password, 
      :remember_me
    ) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :username, 
      :email, 
      :password, 
      :password_confirmation, 
      :current_password
    ) }
  end
  
end
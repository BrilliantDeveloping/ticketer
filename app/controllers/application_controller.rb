class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exc|
    render text: exc, status: 500
  end 
  protect_from_forgery with: :exception
  
  before_action :set_model_name
  
  def set_model_name
    @m = Kernel.const_get(controller_name.classify)
  end
  
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :rememberable, :trackable
         
  # def ldap_before_save
#    self.email = Devise::LDAP::Adapter.get_ldap_param(self.username,"mail").first
#   end
  
end
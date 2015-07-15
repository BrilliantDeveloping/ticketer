class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :rememberable, :trackable
         
#   def ldap_before_save
#     self.userid = Devise::LDAP::Adapter.get_ldap_param(self.login,"cn").first
#   end
  
end

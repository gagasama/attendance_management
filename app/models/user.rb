class User < ActiveRecord::Base
  attr_accessible :access_token, :email, :expires, :name, :provider, :refresh_token, :uid
end

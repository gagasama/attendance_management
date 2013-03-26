class UserController < ApplicationController
  def index
    @users = User.all(:select => "lastname, firstname")
  end
end

class User::SessionsController < ApplicationController
  def create

    auth = request.env["omniauth.auth"]
    if Rails.env.production?
      # For PostgreSQL. You have a nummeric Unix Timestamp value here – whereas the PostgreSQL data type      # timestamp obviously has to be given in another format.
      expires_at = Time.at(auth['credentials'].expires_at)
    else #For other DataBese
      expires_at = auth["credentials"]["expires_at"] 
    end
    user = User.where(:provider => auth["provider"], :uid => auth["uid"]).first_or_initialize(
      :refresh_token => auth["credentials"]["refresh_token"],
      :access_token => auth["credentials"]["token"],
      :expires => expires_at, 
      :name => auth["info"]["name"],
      :email => auth["info"]["email"],
    )
    url = session[:return_to] || root_path
    session[:return_to] = nil
    url = root_path if url.eql?('/logout')

    if user.save
      session[:user_id] = user.id
      notice = "Signed in!"
      logger.debug "URL to redirect to: #{url}"
      redirect_to url, :notice => notice
    else
      raise "Failed to login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end

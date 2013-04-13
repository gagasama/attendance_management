class AttendanceManagementUsers::SessionsController < Devise::SessionsController
  #after_filter :redirect_after_login 
 
  def new
    super
  end

  def redirect_after_login
    redirect_to :controller => 'user', :action => 'index' 
  end

end

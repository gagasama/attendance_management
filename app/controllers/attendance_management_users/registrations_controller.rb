# -*- encoding: utf-8 -*-
class AttendanceManagementUsers::RegistrationsController < Devise::RegistrationsController 
  def create
   if @user = User.find_by_mail(params[:email])
      super
   else
      @user = ""
      flash[:alert] = "Redmineに入力されているemailアドレスが存在しません。"
      #render :action => "new" 
      redirect_to :action => 'new'
   end	   
  end
end

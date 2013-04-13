# -*- encoding: utf-8 -*-
class UserController < ApplicationController
  before_filter :authenticate_attendance_management_user!

  def index
    @users = User.all(:select => "lastname, firstname")
  end

  def show
     
    unless @user = User.find_by_mail(current_user.email)
      @user = ""
      flash.now[:notice] = "Redmineに入力されているemailアドレスが存在しません。"
      render new_attendance_management_user_registration 
    end
    @attendance_time = AttendanceTime.find_by_user_id(current_user.id) 
  end


  def regist_attendance_time
     #今日の出勤時間が登録されていなければ登録
   @attendance_time = current_user.create_attendance_time  
  end

  def regist_leaving_time
     #今日の退勤時間が登録されていなければ登録
   @leaving_time = current_user.create_leaving_time  
  end

private
  def current_user
    current_attendance_management_user
  end

end

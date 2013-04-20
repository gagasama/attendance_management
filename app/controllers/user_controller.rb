# -*- encoding: utf-8 -*-
class UserController < ApplicationController 

  def index
    @users = User.all(:select => "email")
  end

  def show
    logger.debug "session : " + session.inspect
    logger.debug "user  : #{session["devise.google_data"]}"
    logger.debug "params : #{params.inspect}"
    @user = current_user 
    # @attendance_time = AttendanceTime.find_by_user_id(current_user.id) 
  end


  def regist_attendance_time
    #今日の出勤時間が登録されていなければ登録
    @attendance_time = current_user.create_attendance_time  
  end

  def regist_leaving_time
    #今日の退勤時間が登録されていなければ登録
    @leaving_time = current_user.create_leaving_time  
  end


end

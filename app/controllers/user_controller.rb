# -*- encoding: utf-8 -*-
class UserController < ApplicationController 
  before_filter :current_user
  def index
    @users = User.all(:select => "email")
  end

  def show
    if @current_user.present?
      @monthly_attendances = @current_user.find_month_attendance_days(Date.today) 
    end
  end


  def clock_in
    user_attendance = @current_user.attendance_days
    today_attendance = user_attendance.find_by_date(params[:datetime].to_date)
 
    unless today_attendance 
      user_attendance.create!(:date => params[:datetime], :clock_in => params[:datetime] )
    else
      today_attendance.update_attributes!(:date => params[:datetime], :clock_in => params[:datetime] )
    end
    @clock_in_time = params[:datetime]
    #render :nothing => true
    render "user/show", :json => {:time => params[:datetime]}
  end

  def clock_out
    user_attendance = @current_user.attendance_days
    today_attendance = user_attendance.find_by_date(params[:datetime])
    unless today_attendance
      status = user_attendance.create!(:date => params[:datetime], :clock_out => params[:datetime] )
    else
      status = today_attendance.update_attributes!({:date => params[:datetime], :clock_out => params[:datetime]})

    end
    @clock_out_time = params[:datetime]
  end


end

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
    today_attendance = user_attendance.find_by_date(params[:date])
    unless user_attendance.exists?(:date => params[:date])
      user_attendance.create!(:date => params[:date], :clock_in => params[:time] )
    else
      today_attendance.update_attributes!(:date => params[:date], :clock_in => params[:time] )
    end
    @clock_in_time = params[:time]
  end

  def clock_out
    user_attendance = @current_user.attendance_days
    today_attendance = user_attendance.find_by_date(params[:date])
    unless user_attendance.exists?(:date => params[:date])
      user_attendance.create!(:date => params[:date], :clock_out => params[:time] )
    else
      today_attendance.update_attributes!({:date => params[:date], :clock_out => params[:time]})

    end
    @clock_out_time = params[:time]
  end


end

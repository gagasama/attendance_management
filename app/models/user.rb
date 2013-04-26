class User < ActiveRecord::Base
  attr_accessible :access_token, :email, :expires, :name, :provider, :refresh_token, :uid
  has_many :attendance_days
  def create_attendance_time 
    today = Date.today
    now_time = Time.now
    self.attendance_times.create({:date => Date.today, :time => Time.now})
  end

  def find_month_attendance_days criterion_day 
    self.attendance_days.by_month(criterion_day)
  end

  def todays_attendance_time
    self.attendance_times.find_by_date(Date.today).time
  end

end

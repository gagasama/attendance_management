class AttendanceDay < ActiveRecord::Base 
  belongs_to :user
  belongs_to :attendance_category
  attr_accessible :break_time, :clock_in, :clock_out, :date, :remarks
  scope :by_month, lambda {|target_date| self.where("date >= ? and date <= ?", target_date.beginning_of_month, target_date.end_of_month ) 
  } 

  validates :user_id, :uniqueness => {:scope => :date}  

  

end


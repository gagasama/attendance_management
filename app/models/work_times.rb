class WorkTimes < ActiveRecord::Base
  belongs_to :attendance_management_user
  attr_accessible :attendance_time, :date, :leaving_time
end

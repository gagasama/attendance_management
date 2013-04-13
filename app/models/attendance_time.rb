class AttendanceTime < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :time
end

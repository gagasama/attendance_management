class WorkHour < ActiveRecord::Base
  belongs_to :user
  attr_accessible :attendance, :date, :leaving
end

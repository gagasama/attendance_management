class LeavingTime < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :time
end

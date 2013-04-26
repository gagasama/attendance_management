module Day
  include ActiveRecord::Validations
  validates :user_id, :uniqueness => {:scope => :date}
end

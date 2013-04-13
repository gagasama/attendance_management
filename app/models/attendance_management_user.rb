# == Schema Information
#
# Table name: attendance_management_users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class AttendanceManagementUser < ActiveRecord::Base
  has_many :work_times
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def create_attendance_time
    now = Time.now
    now_date = now.to_date
    #pry.binding
    #このユーザーでnowじゃなかったらインサート
    AttendanceTime.where(:user_id => self.id, :date => now_date, :time => now).first_or_create
    now
  end

  def create_leaving_time
    if self.work_times.size > 0
      self.work_times.create({:date => Date.today, :leaving_time => Time.now})
    end
  end
end

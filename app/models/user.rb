# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  login             :string(30)       default(""), not null
#  hashed_password   :string(40)       default(""), not null
#  firstname         :string(30)       default(""), not null
#  lastname          :string(30)       default(""), not null
#  mail              :string(60)       default(""), not null
#  admin             :boolean          default(FALSE), not null
#  status            :integer          default(1), not null
#  last_login_on     :datetime
#  language          :string(5)        default("")
#  auth_source_id    :integer
#  created_on        :datetime
#  updated_on        :datetime
#  type              :string(255)
#  identity_url      :string(255)
#  mail_notification :string(255)      default(""), not null
#

class User < ActiveRecord::Base
#   alias_attribute :type, :etype 
  
  def to_hash
    Hash[*self.map{ |i| [i.id, i]}.flatten]
  end 
end

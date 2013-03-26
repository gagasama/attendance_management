class User < ActiveRecord::Base
   alias_attribute :type, :etype 
end

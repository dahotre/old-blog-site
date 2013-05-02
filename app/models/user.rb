# == Schema Information
# Schema version: 20111016022127
#
# Table name: users
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :transactions
end

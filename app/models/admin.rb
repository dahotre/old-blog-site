# == Schema Information
# Schema version: 20120303191227
#
# Table name: admins
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  password   :string(255)
#  atype      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Admin < ActiveRecord::Base
end

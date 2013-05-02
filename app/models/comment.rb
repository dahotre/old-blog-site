# == Schema Information
# Schema version: 20110628050535
#
# Table name: comments
#
#  id             :integer         not null, primary key
#  comment        :string(255)
#  commentor      :string(255)
#  email          :string(255)
#  rambling_id    :integer
#  programming_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Comment < ActiveRecord::Base
end

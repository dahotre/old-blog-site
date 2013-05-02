# == Schema Information
# Schema version: 20110628050535
#
# Table name: citations
#
#  id             :integer         not null, primary key
#  link           :string(255)
#  citation_title :string(255)
#  author         :string(255)
#  rambling_id    :integer
#  programming_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Citation < ActiveRecord::Base
  belongs_to :ramblings, :touch => true
  belongs_to :programmings, :touch => true
  
  before_save :only_one_node
  
  def only_one_node
    if self.rambling_id == nil && self.programming_id == nil
      self.errors[:base] << "Both node ids are nil"
      return false
    elsif self.rambling_id != nil && self.programming_id != nil
      self.errors[:base] << "At least 1 node id shd be nil"
      return false
    end
    return true
  end
end
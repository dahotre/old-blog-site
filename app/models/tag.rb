# == Schema Information
# Schema version: 20110628050535
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  count      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  has_and_belongs_to_many :ramblings
  has_and_belongs_to_many :programmings
  attr_accessible :count, :name

  before_save :default_attrs
  
  def nodes
    ns = Array.new
    if self.ramblings.size > 0
      ns += self.ramblings 
    end
    if self.programmings.size > 0
      ns += self.programmings 
    end
    return ns
  end

  private
  def default_attrs
    p "In bef save for tags"
    if self.count.nil?
      self.count = 1
      p "count nil"
    elsif self.count >= 0
      self.count += 1
      p "count >= 0"
    end
  end
end

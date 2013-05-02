# == Schema Information
# Schema version: 20111030002047
#
# Table name: transactions
#
#  id             :integer         not null, primary key
#  user_id        :integer
#  programming_id :integer
#  rambling_id    :integer
#  remote_ip      :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  user_agent     :string(255)
#  rec            :boolean
#

class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :programming
  belongs_to :rambling
  attr_accessible :programming_id, :rambling_id, :remote_ip, :user_agent, :user_id, :rec
  
  def node
    if !programming.nil?
      programming
    elsif !rambling.nil?
      rambling
    end
  end
end

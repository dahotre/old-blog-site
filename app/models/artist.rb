# == Schema Information
# Schema version: 20110828040213
#
# Table name: artists
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  url        :string(255)
#  bio        :text
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  exhibit    :text
#  art        :string(255)
#  fb_url     :string(255)
#

class Artist < ActiveRecord::Base
  has_many :wallpapers
  has_one :song
  accepts_nested_attributes_for :song
end

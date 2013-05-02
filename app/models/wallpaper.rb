# == Schema Information
# Schema version: 20111002102040
#
# Table name: wallpapers
#
#  id                   :integer         not null, primary key
#  url                  :string(255)
#  artist_id            :integer
#  created_at           :datetime
#  updated_at           :datetime
#  width                :integer
#  height               :integer
#  fromDate             :date
#  toDate               :date
#  copyright_image_url  :string(255)
#  copyright_source_url :string(255)
#  story                :string(255)
#

require 'date'
class Wallpaper < ActiveRecord::Base
  attr_accessible :fromDate, :toDate, :url, :artist_id, :width, :height, :copyright_source_url, :copyright_image_url, :story
  belongs_to :artist, :touch => true
  url_regex = /[a-z\d\_\-]+.[a-z]+/i

  validates :url, :presence => true,
  :format => { :with => url_regex},
  :uniqueness => true

  before_save :default_attrs
  private
  def default_attrs
    if (self.fromDate.blank?)
      self.fromDate = Date.today
    end
    if (self.toDate.blank?)
      self.toDate = Date.today.plus_with_duration(30)
    end
    if (self.width.nil?)
      self.width = 700
    end
    if (self.height.nil?)
      self.height = 450
    end
    if self.copyright_image_url.blank?
      self.copyright_image_url = "ccl2.png"
    end
    if self.copyright_source_url.nil?
      self.copyright_source_url = "http://creativecommons.org/licenses/by-sa/3.0/"
    end
  end
  
end

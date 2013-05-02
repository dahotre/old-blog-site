# == Schema Information
# Schema version: 20111002102040
#
# Table name: programmings
#
#  id         :integer         not null, primary key
#  url_title  :string(255)
#  title      :string(255)
#  html       :text
#  views      :integer
#  author     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  draft      :boolean
#

class Programming < ActiveRecord::Base
  include Node

  has_and_belongs_to_many :tags
  has_many :citations
  has_many :comments
  accepts_nested_attributes_for :citations, :allow_destroy => true
  accepts_nested_attributes_for :tags
  before_save :default_attrs
end

# == Schema Information
# Schema version: 20110828204418
#
# Table name: songs
#
#  id                      :integer         not null, primary key
#  name                    :string(255)
#  vendor                  :string(255)
#  affiliate_code          :text
#  artist_id               :integer
#  created_at              :datetime
#  updated_at              :datetime
#  affiliate_code_expanded :text
#

class Song < ActiveRecord::Base
  belongs_to :artist
end

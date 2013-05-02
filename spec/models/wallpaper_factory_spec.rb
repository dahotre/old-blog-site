require 'spec_helper'

describe 'WallpaperFactory' do
  
  it "Should return last of the wallpapers that satisfy the fromDate<->toDate condition" do
    expected = Wallpaper.where("fromDate <= ? AND toDate >= ?", Date.today, Date.today).last
    actual = WallpaperFactory.instance.get_wallpaper
    actual.should equal expected
  end
end
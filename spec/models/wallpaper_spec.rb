require 'spec_helper'

describe Wallpaper do
  before(:each) do
    @params = {:fromDate => Date.today.to_s(:number), :toDate => Date.today.next_month.to_s(:number), :url => "wallpaper.jsp", :artist_id => 1}
  end

  it "Should create a wallpaper instance given valid params" do
    Wallpaper.create!(@params)
  end

  it "Should have a non null url" do
    w = Wallpaper.new(@params.merge( :url => ""))
    w.should_not be_valid
  end

  it "Should reject invalid urls" do
    w = Wallpaper.new(@params.merge(:url => "x"))
    w.should_not be_valid
  end

  it "Should have a default FROM & TO date" do
    wallpaper = Wallpaper.create(:url => "wallpaper.jpg")
    wallpaper.save
    wallpaper.fromDate.should == Date.today
    wallpaper.toDate.should == Date.today.plus_with_duration(7)
  end

  Hash[:height => 450, :width => 700].each do |key, value|
    it "Should have a default dimensions : #{key}" do
      wallpaper = Wallpaper.new(:url => "wallpaper.jpg")
      wallpaper.save
      wallpaper.attribute_for_inspect(key).should == (value).to_s
    end
  end
  
end

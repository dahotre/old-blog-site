require 'spec_helper'

describe Tag do

  it "should be created" do
    tag1 = Tag.create!({:name => "ruby", :count => 1})
    tag2 = Tag.create!({:name => "rails", :count => 1})
  end
  
  it "should have a default count value of 1" do
    tag1 = Tag.new({:name => "ruby"})
    tag1.save
    tag1.count.should == 1
  end

  it "should increment count if tag already exists" do
    tag1 = Tag.find_or_initialize_by_name("ruby_test")
    tag1.save
    tag1.should be_valid
    tag1.count.should == 1
    tag2 = Tag.find_or_initialize_by_name("ruby_test")
    tag2.save
    tag2.should be_valid
    tag2.count.should == 2
    Tag.where("name = ?", "ruby_test").size.should == 1
  end
end

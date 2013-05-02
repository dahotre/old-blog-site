require 'spec_helper'

describe Rambling do
  html = "<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla at turpis eget nibh ultricies dignissim. Duis luctus euismod turpis. Mauris augue. Aliquam facilisis semper elit. Pellentesque semper hendrerit arcu. Phasellus eleifend commodo justo. Aliquam orci urna, imperdiet sit amet, posuere in, lobortis et, risus. Integer interdum nonummy erat. Nullam tellus. Sed accumsan. Vestibulum orci ipsum, eleifend vitae, mollis vel, mollis sed, purus. Suspendisse mollis elit eu magna. Morbi egestas. Nunc leo ipsum, blandit ac, viverra quis, porttitor quis, dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vivamus scelerisque ipsum ut justo. Pellentesque et ligula eu massa sagittis rutrum. In urna nibh, eleifend vel, suscipit ut, sagittis id, nunc.</p>	<p>Nam ut sapien sed pede pulvinar rutrum. Nunc eu elit sed augue aliquet tincidunt. Morbi rutrum. Vestibulum dui turpis, lobortis quis, euismod sed, consectetuer sit amet, nunc. Nam mi. Fusce at nisl eu tortor bibendum eleifend. Sed ac metus. Phasellus nec elit. Morbi tortor nulla, tristique a, adipiscing at, consectetuer et, nisi. Nunc vel sapien sed risus hendrerit egestas. Vivamus turpis arcu, placerat eu, congue vel, commodo ut, nisl.</p>"

  before(:each) do
    @params = {:url_title => "url-title-test", :title => "Longer readable title test RSpec", :html => html, :views => 0, :author => "Test AUth"}
  end

  it "Should create a rambling instance given valid params" do
    p = Rambling.new(@params)
    p.save
    p1 = Rambling.where("url_title = ?", "url-title-test").last
    p1.should_not be_nil
    p1.should be_valid
    p.should == p1
  end
  
  it "Should access previously stored records in db for rambles" do
    ps = Rambling.where("author = ?", "Test AUth")
    ps.should_not be_nil
    ps.size.should == 2
  end

    it "Should create a rambling instance & tags given valid params" do
      p = Rambling.new(@params)
      t1 = Tag.find_or_create_by_name("rails_test")
      t2 = Tag.find_or_create_by_name("rspec_test")
      p.tags = [t1, t2]
      p.save
      p1 = Rambling.where("url_title = ?", "url-title-test").last
      p1.should_not be_nil
      p1.should be_valid
      p.should == p1
      p.tags.should == [t1, t2]
    end

end

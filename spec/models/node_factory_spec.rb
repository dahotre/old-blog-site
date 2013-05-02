require 'spec_helper'

describe 'NodeFactory' do

  it "Should return all the programming entries in db" do
    progs = NodeFactory.instance.get_programmings
    dbProgs = Programming.order("updated_at DESC")
    progs.should_not be_nil
    progs.should == dbProgs
  end

  it "Should be able to reset & get the singleton instance or prgs" do
    progs = NodeFactory.instance.get_programmings
    progs.should_not be_nil
    resetProgs = NodeFactory.instance.reset_programmings
    resetProgs.should be_nil
    newProgs = NodeFactory.instance.get_programmings
    progs.should == newProgs
  end

  it "Should return all the rambling entries in db" do
    rambles = NodeFactory.instance.get_ramblings
    dbRambles = Rambling.order("updated_at DESC")
    rambles.should_not be_nil
    rambles.should == dbRambles
  end

  it "Should be able to reset & get the singleton instance of rambles" do
    rambles = NodeFactory.instance.get_ramblings
    rambles.should_not be_nil
    resetRambles = NodeFactory.instance.reset_ramblings
    resetRambles.should be_nil
    newRambles = NodeFactory.instance.get_ramblings
    rambles.should == newRambles
  end

  it "Should return <= 3 latest programmings" do
    params = {:title => "rspec is awesome", :html => "<p>Hello world from awesome rspec</p>", :author => "rspec auth"}
    url_titles = ["url-title-rspec-1", "url-title-rspec-2", "url-title-rspec-3"]
    url_titles.each{|url_title, i| Programming.create(params.merge(:url_title => url_title))}
    topProgs = NodeFactory.instance.top_programmings(3)
    topProgs.should_not be_nil
    topProgs.size.should == 3
    url_titles.each{|curr_url| topProgs.find{|curr_prog| curr_prog.url_title == curr_url}.should_not be_nil}
  end

  it "Should return exactly 1 programming node when given proper url-title" do
    params = {:title => "rspec is awesome", :html => "<p>Hello world from awesome rspec</p>", :author => "rspec auth"}
    url_titles = ["url-title-rspec-1", "url-title-rspec-2", "url-title-rspec-3"]
    url_titles.each{|url_title| Programming.create(params.merge(:url_title => url_title))}
    currProg = NodeFactory.instance.get_programming_node(url_titles[0])
    currProg.should_not be_nil
    currProg.should be_valid
    currProg.title.should == "rspec is awesome"
  end

  it "Should return exactly 1 rambling node when given proper url-title" do
    params = {:title => "rspec is awesome", :html => "<p>Hello world from awesome rspec</p>", :author => "rspec auth"}
    url_titles = ["url-title-rspec-1", "url-title-rspec-2", "url-title-rspec-3"]
    url_titles.each{|url_title| Rambling.create(params.merge(:url_title => url_title))}
    currRamb = NodeFactory.instance.get_rambling_node(url_titles[0])
    currRamb.should_not be_nil
    currRamb.should be_valid
    currRamb.title.should == "rspec is awesome"
  end

end
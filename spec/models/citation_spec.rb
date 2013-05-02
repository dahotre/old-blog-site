require 'spec_helper'

describe Citation do
  before(:each) do
    @params = {:link => "http://guides.rubyonrails.org/layouts_and_rendering.html", :citation_title => "Ruby on Rails Guides", :author => ""}
  end
  
  it "Should create a citation for existing programming" do
    Citation.create!(@params.merge(:programming_id => 1))
  end
  
  it "Should create a citation for existing rambling" do
    Citation.create!(@params.merge(:rambling_id => 1))
  end
  
  it "Should be invalid if both prog & ramb id are passed" do
    c = Citation.new(@params.merge(:rambling_id => 1, :programming_id => 1))
    c.save.should be_false
    c.errors.full_messages[0].should == "At least 1 node id shd be nil"
  end
  
end

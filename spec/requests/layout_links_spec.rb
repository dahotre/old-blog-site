require 'spec_helper'

describe "LayoutLinks" do
  
  it "Should have home at '/'" do
    get '/'
    response.should have_selector('title', :content => "dahotre.com")
  end
  
end

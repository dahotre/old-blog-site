require 'spec_helper'

describe RamblingsController do
  render_views

  describe "GET 'Ramblings'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it 'should have a proper title' do
      get 'index'
      response.should have_selector('title', :content => "Rambling")
    end
  end
end

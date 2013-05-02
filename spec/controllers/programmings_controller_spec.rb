require 'spec_helper'

describe ProgrammingsController do
  render_views

  describe "GET 'Programmings'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it 'should have a proper title' do
      get 'index'
      response.should have_selector('title', :content => "Programming")
    end
  end
end

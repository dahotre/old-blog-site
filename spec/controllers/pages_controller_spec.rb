require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end

  describe "Title for 'home' page" do
    it "Should be 'dahotre.com'" do
      get 'home'
      response.should have_selector("title", :content => "dahotre.com | Home")
    end
  end

  describe "Title for 'contact' page" do
    it "Should be 'dahotre.com'" do
      get 'contact'
      response.should have_selector("title", :content => "dahotre.com | Contact")
    end
  end

end

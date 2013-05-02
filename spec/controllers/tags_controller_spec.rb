require 'spec_helper'

describe TagsController do
  render_views

  describe "GET 'Ramblings'" do
    it "index should be successful" do
      get 'index'
      response.should be_success
    end
  end

end

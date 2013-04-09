require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the content 'Landing Page'" do
      visit '/static_pages/home'
      page.should have_content('Landing Page')
    end
  end
end

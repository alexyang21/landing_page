require 'spec_helper'

describe "StaticPages" do

	describe "Home Page" do
		it "should have the title 'Landing Page'" do
			visit root_path
			page.should have_selector('title', text: "Landing Page")
		end
	end
	
end

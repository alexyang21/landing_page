require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "signup" do
		before { visit root_path }

		let(:submit) { "Sign Up" }
		
		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "First name",			with: "First"
				fill_in "Last name", 			with: "Last"
				fill_in "Email", 				with: "user@example.com"
				fill_in "Vacation start",	with: "04-10-2013"
				fill_in "Vacation end", 		with: "04-17-2013"
				fill_in "Zipcode",				with: "94112"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end

	end
end

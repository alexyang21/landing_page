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
				fill_in "user_first_name",			with: "First"
				fill_in "user_last_name", 			with: "Last"
				fill_in "user_email", 				with: "user@example.com"
				fill_in "user_vacation_start",		with: "04-10-2013"
				fill_in "user_vacation_end", 		with: "04-17-2013"
				fill_in "user_zipcode",				with: "94112"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end

	end
end

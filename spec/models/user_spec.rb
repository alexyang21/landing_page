# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  first_name     :string(255)
#  last_name      :string(255)
#  email          :string(255)
#  vacation_start :string(255)
#  vacation_end   :string(255)
#  zipcode        :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe User do

	before {
		@user = User.new(
			first_name: "Example",
			last_name: "User",
			email: "user@example.com",
			vacation_start: "04-10-2013",
			vacation_end: "04-17-2013",
			zipcode: "94112")
	}

	subject { @user }

	it { should respond_to(:first_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:email) }
	it { should respond_to(:vacation_start) }
	it { should respond_to(:vacation_end) }
	it { should respond_to(:zipcode) }

	it { should be_valid }

	describe "when first_name is not present" do
		before { @user.first_name = " " }
		it { should_not be_valid }
	end
	describe "when last_name is not present" do
		before { @user.last_name = " " }
		it { should_not be_valid }
	end
	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end
	describe "when vacation_start is not present" do
		before { @user.vacation_start = " " }
		it { should_not be_valid }
	end
	describe "when vacation_end is not present" do
		before { @user.vacation_end = " " }
		it { should_not be_valid }
	end
	describe "when zipcode is not present" do
		before { @user.zipcode = " " }
		it { should_not be_valid }
	end

	describe "when first_name is too long" do
		before { @user.first_name = "a" * 51 }
		it { should_not be_valid }
	end
	describe "when last_name is too long" do
		before { @user.last_name = "a" * 51 }
		it { should_not be_valid }
	end
	describe "when email is too long" do
		before { @user.email = "a" * 51 }
		it { should_not be_valid }
	end
	describe "when vacation_start is too long" do
		before { @user.vacation_start = "a" * 9 }
		it { should_not be_valid }
	end
	describe "when vacation_end is too long" do
		before { @user.vacation_end = "a" * 9 }
		it { should_not be_valid }
	end
	describe "when zipcode is too long" do
		before { @user.zipcode = "a" * 6 }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo. 
				foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				@user.should_not be_valid
			end
		end
	end
	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				@user.should be_valid
			end
		end
	end
	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end

	describe "when vacation date is invalid" do
		it "should be invalid" do
			dates = %w[4-10-2013 04-10-13 04/10/2013 04/10/13]
			dates.each do |invalid_date|
				@user.vacation_start = invalid_date
				@user.should_not be_valid
			end
		end
	end
	describe "when vacation date is valid" do
		it "should be valid" do
			dates = %w[04-10-2013 11-10-2013]
			dates.each do |valid_date|
				@user.vacation_start = valid_date
				@user.should be_valid
			end
		end
	end
	
	describe "when zipcode is invalid" do
		it "should be invalid" do
			zipcodes = %w[9203 000000 20395-4021]
			zipcodes.each do |invalid_zipcode|
				@user.zipcode = invalid_zipcode
				@user.should_not be_valid
			end
		end
	end
	describe "when zipcode is valid" do
		it "should be valid" do
			zipcodes = %w[92033 10000]
			zipcodes.each do |valid_zipcode|
				@user.zipcode = valid_zipcode
				@user.should be_valid
			end
		end
	end
end

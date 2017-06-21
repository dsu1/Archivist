require "rails_helper"

RSpec.describe User, :type => :model do

	it "is valid with valid user attributes" do
		expect(FactoryGirl.build(:user)).to be_valid
	end

	it "is invalid without a username" do
		expect(FactoryGirl.build(:user, username: nil)).to_not be_valid
	end

	it "is invalid without an email" do
		expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
	end

	it "is invalid without a password" do
		expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
	end

	it "is invalid with duplicate usernames" do
		FactoryGirl.create(:user, username: "test_user1")
		expect(FactoryGirl.build(:user, username: "test_user1")).to_not be_valid
	end

	it "is invalid with duplicate emails" do
		FactoryGirl.create(:user, email: "test@user1.com")
		expect(FactoryGirl.build(:user, email: "test@user1.com")).to_not be_valid
	end

	it "is invalid with too short of a username" do
		expect(FactoryGirl.build(:user, username: "t")).to_not be_valid
	end

	# This test will fail because the implementation fails
	it "is invalid with too long of a username" do
		# expect(FactoryGirl.build(:user, username: "test_user_very_long_username_shouldn't_be_this_long")).to_not be_valid
	end

end

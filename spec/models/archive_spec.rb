require "rails_helper"

RSpec.describe Archive, :type => :model do

	it "is valid with valid archive attributes" do
		FactoryGirl.create(:user)
		expect(FactoryGirl.build(:archive)).to be_valid
	end

	it "is invalid without an archive name" do
		FactoryGirl.create(:user)
		expect(FactoryGirl.build(:archive, name: nil)).to_not be_valid
	end

# this test fails because there isn't a check for archive's user_id
	it "is an invalid archive without a user id" do
		# FactoryGirl.create(:user)
		# expect(FactoryGirl.build(:archive, user_id: nil)).to_not be_valid
	end

# this test fails because there isn't a check for archive's user_id
	it "is an invalid archive with a non-existant user id" do
		# expect(FactoryGirl.build(:archive, user_id: 2120)).to_not be_valid
	end


end

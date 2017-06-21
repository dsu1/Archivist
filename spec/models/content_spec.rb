require "rails_helper"

RSpec.describe Archive, :type => :model do

	it "is valid with valid content attributes" do
		FactoryGirl.create(:archive)
		expect(FactoryGirl.build(:content)).to be_valid
	end

	it "is invalid without an archive name" do
		FactoryGirl.create(:archive)
		expect(FactoryGirl.build(:content, title: nil)).to_not be_valid
	end

end

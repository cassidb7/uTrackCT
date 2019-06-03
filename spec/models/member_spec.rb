require "rails_helper"
RSpec.describe Member, :type => :model do

  before(:all) do
    @member1 = create(:member)
  end

  it "is valid with valid attributes" do
    expect(@member1).to be_valid
  end

  it "is not valid without a name" do
    member2 = build(:member, name: nil)
    expect(member2).to_not be_valid
  end

  it "is not valid without a website_url" do
    member2 = build(:member, website_url: nil)
    expect(member2).to_not be_valid
  end
end
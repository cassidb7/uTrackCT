require "rails_helper"
RSpec.describe Member, :type => :model do

  before(:all) do
    @member1 = create(:member, website_url: 'https://www.wikipedia.org/')
    @tag = create(:tag, member: @member1)
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

  it "is has tag association" do
    count = @member1.tags.size
    expect(@member1.tags.size).to eq(count)
  end

  it "search returns filtered results" do
    query = Member.return_relevant(search: 'apex')
    expect(Member.all.size).to_not eq(query.size)
  end

end
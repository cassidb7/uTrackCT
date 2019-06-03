require 'rails_helper'

RSpec.describe Tag, type: :model do
  before(:all) do
    @member1 = create(:member)
    @tag = create(:tag, member: @member1)
  end

  it "is valid with valid attributes" do
    expect(@member1).to be_valid
  end

  it "is not valid without a name" do
    tag1 = build(:tag, tag_field: nil)
    expect(tag1).to_not be_valid
  end

  it "is not valid without a member_id" do
    tag2 = build(:tag, member: nil)
    expect(tag2).to_not be_valid
  end

  it "is has member association" do
    expect(@tag.member.id).equal?(@member1.id)
  end
end

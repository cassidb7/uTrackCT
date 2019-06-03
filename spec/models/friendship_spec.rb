require 'rails_helper'

RSpec.describe Friendship, type: :model do

  before(:all) do
    @member1 = create(:member, website_url: 'https://www.wikipedia.org/')
    @memberROR = create(:member, website_url: 'https://en.wikipedia.org/wiki/Ruby_on_Rails')
  end

  it "is valid with valid attributes" do
    @member1.befriend(member: @memberROR)
    expect(@member1.friends.pluck(:id)).to include(@memberROR.id)
    expect(@memberROR.friends.pluck(:id)).to include(@member1.id)
  end
end

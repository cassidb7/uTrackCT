require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do

  before(:all) do
    @member1 = create(:member, website_url: 'https://www.wikipedia.org/')
    @memberROR = create(:member, website_url: 'https://en.wikipedia.org/wiki/Ruby_on_Rails')
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, params: {member_id: @member1.id, friend_id: @memberROR.id}
      expect(response).to redirect_to(member_path(@member1))
    end
  end
end

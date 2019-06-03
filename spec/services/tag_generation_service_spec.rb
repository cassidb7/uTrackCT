require 'rails_helper'


describe TagGenerationService do
  before(:all) do
    @member5 = create(:member)
  end

  subject(:create_tag_generation_service) do
    TagGenerationService.new(website_url: @member5.website_url, member_id: @member5.id)
  end

  specify "create records in database for the member" do
    TagGenerationService.new(website_url: @member5.website_url, member_id: @member5.id).run
    expect(@member5.tags).to exist
  end
end


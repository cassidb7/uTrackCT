require 'rails_helper'

describe ShortUrlService do
  before(:all) do
    @member5 = create(:member)
  end

  subject(:create_url_shortening_service) do
    ShortUrlService.new(website_url: @member5.website_url, member: @member5)
  end

  specify "member_shortened_url_field_should be saved" do
    ShortUrlService.new(website_url: @member5.website_url, member: @member5).run
    expect(@member5.shortened_website_url).not_to be_nil
  end
end


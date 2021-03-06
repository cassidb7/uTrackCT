require 'rails_helper'
RSpec.feature "Member", :type =>
    :feature do
  before do
    @member = FactoryBot.create(:member)
    @tag = FactoryBot.create(:tag, member: @member)
  end

  scenario "Creates a new Member" do
    visit "/members/#{@member.id}"

    expect(page).to have_content @member.name
    expect(page).to have_content @member.website_url

    expect(page).to have_content @member.tags.first.tag_field
  end
end
require 'rails_helper'
RSpec.feature "Member", type: :feature do
  before do
    @member = FactoryBot.create(:member)
  end

  # scenario "returns all members" do
  #   visit "/members"
  #   count = Member.all.size
  #   expect(page).to have_content "Showing #{count} members"
  # end

  scenario "returns a filtered list of members" do
    visit "/members?member=Screen"
    count = Member.all.size

    expect(page).not_to have_content "Showing #{count} members"
  end
end
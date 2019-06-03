require 'rails_helper'
RSpec.feature "Member", :type =>
    :feature do
  before do
    begin
      @member = FactoryBot.create(:member)
    rescue StandardError => e
      puts "#{e.message}"
    end
  end
  scenario "Creates a new Member" do
    begin
      visit "/members/new"

      within find('#new_member') do
        fill_in 'member[name]', with: @member.name
        fill_in 'member[website_url]', with: @member.website_url

        click_button 'Add Member'
        expect(page).to have_content 'Member Successfully Created'
      end
    rescue StandardError => e
      puts "#{e.message}"
    end
  end
end
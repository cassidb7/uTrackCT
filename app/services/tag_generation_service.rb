require 'nokogiri'
require 'open-uri'

# constant HEADERS defined in config/initializers/constants.rb
# Service takes a url and a member, scrapes the page for all tags defined in the
# header constant and saves it to the member

class TagGenerationService

  def initialize(website_url:, member_id:)
    @website_url = website_url
    @member = Member.find(member_id)
  end

  def run
    data = data_scraper(url: @website_url)
    header_collection = []
    HEADERS.each do |header|
      data.css(header)&.each do |h|
        header_collection << { tag_field: h.text }
      end
    end
    @member.tags.create(header_collection)
  end

  def data_scraper(url:)
    Nokogiri::HTML(open(url))
  end
end
# app/jobs/shorten_website_url_job.rb
class ShortenWebsiteUrlJob < ApplicationJob
  faktory_options retry: 2
  queue_as :url_shortener

  def perform(website_url:, member:)
    ShortUrlService.new(website_url: website_url, member: member).run
  end
end
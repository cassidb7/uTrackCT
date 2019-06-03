require "httparty"
require "json"
class ShortUrlService
  include HTTParty

  base_uri "https://firebasedynamiclinks.googleapis.com"
  headers  "Content-Type" => "application/json"

  def initialize(website_url:, member:)
    @website_url = website_url
    @member = member
  end

  def run
    short_url = shorten
    member.update(shortened_website_url: short_url) unless short_url.nil?
  end

  private

  def shorten
    query = self.class.post("/v1/shortLinks?key=#{FIREBASE_API_KEY}",
                    body: firebase_request_body)

    response_body = JSON.parse(query.body)
    response_body['shortLink']
  end

  def firebase_request_body
    { "dynamicLinkInfo": { "domainUriPrefix": UTRACKCT_URL, "link": @website_url } }.to_json
  end

  attr_reader :website_url
  attr_accessor :member
end
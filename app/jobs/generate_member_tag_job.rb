# app/jobs/generate_member_tag_job.rb
class GenerateMemberTagJob < ApplicationJob
  faktory_options retry: 2
  queue_as :tag_generation

  def perform(website_url:, member:)
    TagGenerationService.new(website_url: website_url, member: member).run
  end
end
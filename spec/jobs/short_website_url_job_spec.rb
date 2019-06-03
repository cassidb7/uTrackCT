RSpec.describe ShortenWebsiteUrlJob do
  it "matches with enqueued job" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      ShortenWebsiteUrlJob.perform_later
    }.to have_enqueued_job(ShortenWebsiteUrlJob)
  end
end
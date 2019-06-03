RSpec.describe GenerateMemberTagJob do
  it "matches with enqueued job" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      GenerateMemberTagJob.perform_later
    }.to have_enqueued_job(GenerateMemberTagJob)
  end
end
class Member < ApplicationRecord

  # validations
  validates :name, :website_url, presence: true

  # associations
  has_many :tags

  # callbacks
  after_create :tag_generation_process, :generate_short_url

  # methods
  def generate_short_url
    ShortenWebsiteUrlJob.perform_later(website_url: website_url, member: self)
  end

  def tag_generation_process
    GenerateMemberTagJob.perform_later(website_url: website_url, member: self)
  end

  def self.return_relevant(search:)
    joins(:tags).where(Tag.arel_table[:tag_field].lower.matches("%#{search}%")).uniq
  end
end

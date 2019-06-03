class Member < ApplicationRecord

  # validations
  validates :name, :website_url, presence: true

  # associations
  has_many :tags

  # callbacks
  after_create :tag_generation_process

  # methods
  def tag_generation_process
    TagGenerationService.new(website_url: self.website_url, member_id: self.id).run
  end

  def self.return_relevant(search:)
    joins(:tags).where(Tag.arel_table[:tag_field].lower.matches("%#{search}%")).uniq
  end
end

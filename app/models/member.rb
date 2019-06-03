class Member < ApplicationRecord

  # validations
  validates :name, :website_url, presence: true

  # associations
  has_many :tags

  # callbacks
  after_create :tag_generation_process



  def tag_generation_process
    TagGenerationService.new(website_url: self.website_url, member_id: self.id).run
  end
end

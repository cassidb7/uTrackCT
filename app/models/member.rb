class Member < ApplicationRecord

  # validations
  validates :name, :website_url, presence: true

  # associations
  has_many :friendships, foreign_key: 'member_id', class_name: 'Friendship'
  has_many :friends, through: :friendships
  has_many :tags

  # callbacks
  after_create :tag_generation_process, :generate_short_url

  # scopes
  scope :return_other_members, ->(member) { where.not(id: member.id)}

  # methods
  def befriend(member:)
    return false unless Member.friendship_exists?(member_id: id, friend_id: member.id)
    friends << member
    member.friends << self
  end

  def generate_short_url
    ShortenWebsiteUrlJob.perform_later(website_url: website_url, member: self)
  end

  def tag_generation_process
    GenerateMemberTagJob.perform_later(website_url: website_url, member: self)
  end

  def self.friendship_exists?(member_id:, friend_id:)
    joins(:friendships).where(id: member_id, friendships: {friend_id: friend_id}).empty?
  end

  def self.return_relevant(search:)
    joins(:tags).where(Tag.arel_table[:tag_field].lower.matches("%#{search}%")).uniq
  end
end

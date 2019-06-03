class Member < ApplicationRecord

  # validations
  validates :name, :website_url, presence: true
end

class Tag < ApplicationRecord
  # associations
  belongs_to :member

  # validations
  validates :tag_field, presence: true
end

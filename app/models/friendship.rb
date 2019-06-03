class Friendship < ApplicationRecord
  # associations
  belongs_to :member, foreign_key: "member_id", class_name: "Member"
  belongs_to :friend, foreign_key: "friend_id", class_name: "Member"
end
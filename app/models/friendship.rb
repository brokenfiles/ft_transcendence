class Friendship < ApplicationRecord

  # the friendship requester
  belongs_to :user
  # the requested friend
  belongs_to :friend, class_name: 'User'

  # scope to get the confirmed friendships
  scope :confirmed, -> { where(confirmed: true) }

end

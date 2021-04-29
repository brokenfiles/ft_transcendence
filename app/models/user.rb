class User < ApplicationRecord

  # Relations
  belongs_to :guild, required: false

  has_many :battles

  # TODO: Friendship
  # TODO: Banned_by

end

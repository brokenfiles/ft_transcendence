class Guild < ApplicationRecord

  # the owner of the guild
  belongs_to :owner, class_name: 'User'
  # the current_war is set if the guild is in a war
  belongs_to :current_war, class_name: 'War', required: false

  # history of wars
  has_many :wars
  # users in the guild
  has_many :users


end

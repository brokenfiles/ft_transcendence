class Tournament < ApplicationRecord

  # the winner of the tournament
  belongs_to :winner, class_name: 'User'
  # the tournament's creator
  belongs_to :host, class_name: 'User', required: false

  # the users who joined the tournament
  has_many :users
  # the battles in the tournament
  has_many :battles

end

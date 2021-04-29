class Battle < ApplicationRecord

  # first_user and second_user are the two users in the battle
  belongs_to :first_user, class_name: 'User'
  belongs_to :second_user, class_name: 'User'

  # the winner is the user that wins the battle
  belongs_to :winner, class_name: 'User', required: false

end

class Battle < ApplicationRecord

  belongs_to :first_user, class_name: 'User'
  belongs_to :second_user, class_name: 'User'

  belongs_to :winner, class_name: 'User', required: false

end

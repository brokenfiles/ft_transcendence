class Tournament < ApplicationRecord

  belongs_to :winner, class_name: 'User'
  belongs_to :host, class_name: 'User', required: false

  has_many :users
  has_many :battles

end

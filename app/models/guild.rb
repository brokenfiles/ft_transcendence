class Guild < ApplicationRecord

  belongs_to :owner, class_name: 'User'
  belongs_to :current_war, class_name: 'War', required: false

  has_many :wars
  has_many :users


end

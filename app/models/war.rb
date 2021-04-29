class War < ApplicationRecord

  belongs_to :first_guild, class_name: 'Guild'
  belongs_to :second_guild, class_name: 'Guild'

  has_many :battles

end

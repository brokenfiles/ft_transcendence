class User < ApplicationRecord

  # the user's guild
  belongs_to :guild, required: false
  # if the user is banned, here's the banner
  belongs_to :banned_by, class_name: 'User', required: false
  # if the user is in a tournament
  belongs_to :tournament, required: false

  # history of his battles
  has_many :battles
  # all the user's best friends
  has_many :friendships

  ## Validations ##

  validates :display_name, uniqueness: true
  validates :login, uniqueness: true

  # @param confirmed if the friends must be confirmed or not
  # @return the user's friends
  def friends (confirmed = true)
    # get the ids where I invited friend
    friend_sent_invitation = Friendship.where(user_id: id, confirmed: confirmed).pluck(:friend_id)
    # get the ids where I got invited
    friend_i_got_invited = Friendship.where(friend_id: id, confirmed: confirmed).pluck(:user_id)
    ids = friend_i_got_invited + friend_sent_invitation
    User.where(id: ids)
  end

  # todo: friend?
  # def friend? (user)
  #
  # end

  # def battles
  #
  # end

end

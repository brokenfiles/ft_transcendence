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

  validates :display_name, presence: true, uniqueness: true, length: 3..16
  validates :login, presence: true, uniqueness: true

  # @param confirmed if the friends must be confirmed or not
  # @return the user's friends
  def friends (confirmed = true)
    # get the ids where I invited friend
    friend_sent_invitation = Friendship.where(user_id: id, confirmed: confirmed)
                                       .pluck(:friend_id)
    # get the ids where I got invited
    friend_i_got_invited = Friendship.where(friend_id: id, confirmed: confirmed)
                                     .pluck(:user_id)
    ids = friend_i_got_invited + friend_sent_invitation
    User.where(id: ids)
  end

  # @return true is the user is friend with parameter, false otherwise
  def friend? (user)
    friends = self.friends
    user.in? friends
  end

  # @return the user's invitations
  def invitations
    Friendship.where(friend_id: id, confirmed: false)
  end

  # function to allow the friend to accept request
  def accept (friendship)
    if friendship.friend_id == id && friendship.confirmed == false
      friendship.confirmed = true
      friendship.save
    end
  end

  # function to allow all parts of the friendship to decline or cancel request
  def decline (friendship)
    if friendship.friend_id == id || friendship.user_id == id
      friendship.destroy
    end
  end

  # @return all the user's battles
  def battles
    Battle.where(first_user_id: id)
          .or(Battle.where(second_user_id: id))
  end

  # @return only the wins battles
  def wins
    battles = self.battles
    battles.select { |battle| battle.winner == self }
  end

  # @return the looses battles
  def loses
    battles = self.battles
    battles.select { |battle| battle.winner != self }
  end

  # how levels are working
  def level
    # dividing by 100 the user's point to get the level
    points.fdiv 100
  end

end

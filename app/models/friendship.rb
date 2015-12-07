class Friendship < ActiveRecord::Base
  validates :user, presence: true
  validates :friend, presence: true
  validates_uniqueness_of :friend_id, scope: [:user_id]
  validate :non_self_friend
  validate :not_already_friend

  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def non_self_friend
    return true if user_id != friend_id
    errors.add(:friend_id, "You cannot add yourself as a friend.")
  end

  def not_already_friend
    return true if Friendship.where(user_id: self.friend_id, friend_id: self.user_id).empty?
    errors.add(:friend_id, "You are already friends.")
  end
end
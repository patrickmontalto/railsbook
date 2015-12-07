class User < ActiveRecord::Base
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # ActiveRecord relations
  has_many :authored_posts, :class_name => "Post", :foreign_key => "author_id", dependent: :destroy

  # establish the many-to-many relationships:
  # passive friendships are those in which said user is the requested friend
  # active_friends are friends a user requested that has accepted (sent)
  # passive_friends are friends which requested a user which the user has accepted (received)
  # pending friends are those which a user has sent an invite to, but have not accepted (sent)
  # a received_friendship is an invitation a user has received, but yet not accepted (received)
  has_many :friendships
  has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

  has_many :active_friends, -> { where(friendships: { accepted: true }) }, 
                            :through => :friendships, :source => :friend
  has_many :passive_friends, -> {where(friendships: { accepted: true }) },
                            :through => :passive_friendships, :source => :user
  has_many :pending_friends, -> {where(friendships: { accepted: false }) },
                            :through => :friendships, :source => :friend
  has_many :received_friends, -> { where(friendships: { accepted: false}) },
                              :through => :passive_friendships, :source => :user

  def mutual_friends
    active_friends | passive_friends
  end

  # user.accept_friend(friendship) will update accepted: to true
  def accept_friend(friendship)
    friendship.update_attributes(accepted: true)
  end
    
end

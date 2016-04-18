class User < ActiveRecord::Base
  validates :name, presence: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "40x40>" }, default_url: "/images/:style/yanks.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
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
  has_many :likes
  has_many :liked_posts, :through => :likes, :source => :post
  has_many :comments, :foreign_key => "author_id"
  has_many :commented_posts, :through => :comments, :source => :post

  def mutual_friends
    active_friends | passive_friends
  end

  # user.accept_friend(friendship) will update accepted: to true
  def accept_friend(friendship)
    friendship.update_attributes(accepted: true)
  end

  def friendship(friend)
    if friendship = Friendship.where(user_id: self, friend_id: friend).first
      friendship
    elsif friendship = Friendship.where(friend_id: self, user_id: friend).first
      friendship
    end
  end

  def role
    "user"
  end
  #def notification_status
    #self.received_friends.any? ? "notifications-unread" : "notifications-read"
  #end
  
  def like(post)
    like = self.likes.build(:post => post)
    like.save
  end

  def unlike(post)
    like = self.likes.find_by(post: post)
    like.destroy
  end

  def like?(post)
    self.likes.where(post: post).any?
  end
    
end
